import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CartRemoteDataSource)
class CartApiRemoteDataSource implements CartRemoteDataSource {
  final Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));

  @override
  Future<void> addToCart(
      {required String productId, required String token}) async {
   try {
      final response = await dio.post(ApiConstant.cartEndPoint,
          data: {"productId": productId},
          options: Options(headers: {"token": token}));
    }catch(exception){
     String? message;
     if(exception is DioException){
       message = exception.response?.data['message'];
     }
     throw RemoteException(message: message ?? exception.toString());
   }
  }

  @override
  Future<CartResponse> getCart({required String token}) async{
    try{
      final response = await dio.get(ApiConstant.cartEndPoint,
          options: Options(headers: {"token": token}));
      return CartResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }


  @override
  Future<CartResponse> updateCartProductQuantity(
      {required String productId, required String quantity, required String token}) async{
    try{
      final response = await dio.put('${ApiConstant.cartEndPoint}/$productId',
          data: {"count": quantity},
          options: Options(headers: {"token": token}));
      return CartResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }

  @override
  Future<CartResponse> deleteProductFromCart(
      {required String productId, required String token})async {

    try{
      final response = await dio.delete('${ApiConstant.cartEndPoint}/$productId',

          options: Options(headers: {"token": token}));
      return CartResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? exception.toString());
    }

  }

  @override
  Future<void> clearCart({required String token}) async{
    try{
     await dio.delete(ApiConstant.cartEndPoint,

          options: Options(headers: {"token": token}));

    }catch(exception){
      String? message;
      if(exception is DioException){
        message = exception.response?.data['message'];
      }
      throw RemoteException(message: message ?? exception.toString());
    }
  }


}