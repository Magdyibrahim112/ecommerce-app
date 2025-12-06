import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/data/models/ProductsResponse.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: ProductsRemoteDataSource)
class ProductsApiRemoteDataSource implements ProductsRemoteDataSource{
 Dio dio =Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));
  @override
  Future<ProductsResponse> getProducts({String? productId}) async{
   try {
      final response = await dio.get(ApiConstant.productsEndPoint,
          queryParameters: productId == null ? null : {"category": productId});
      return ProductsResponse.fromJson(response.data);
    }catch(exception){
     String? message;
     if(exception is DioException){
       message = exception.response?.data['message'];
     }
     throw RemoteException(message: message ?? exception.toString());
   }
  }

}