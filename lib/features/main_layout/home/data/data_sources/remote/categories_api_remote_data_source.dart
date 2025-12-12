import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';
// this class depend on dio
@LazySingleton(as: CategoriesRemoteDataSource)
class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource{
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));
  @override
  Future<CategoriesResponse> getCategories() async {
    try{
      final response = await dio.get(ApiConstant.categoriesEndPoint);
      return CategoriesResponse.fromJson(response.data); // return row data
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? "Failed to get categories");
    }
  }
}
