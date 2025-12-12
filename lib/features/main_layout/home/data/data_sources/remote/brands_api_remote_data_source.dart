import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/brands_response/BrandsResponse.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: BrandsRemoteDataSource)
class BrandsApiRemoteDataSource implements BrandsRemoteDataSource{
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));
  @override
  Future<BrandsResponse> getBrands() async{
    try{
      final response = await dio.get(ApiConstant.brandsEndPoint);
      return BrandsResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? "Failed to get brands");

    }
  }

}