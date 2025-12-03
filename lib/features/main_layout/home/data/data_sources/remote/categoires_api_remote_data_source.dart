import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_response/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<CategoriesResponse> getCategories() async {
    try{
      final response = await dio.get(ApiConstant.categoriesEndPoint);
      return CategoriesResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? "Failed to get categories");
    }
  }
}
