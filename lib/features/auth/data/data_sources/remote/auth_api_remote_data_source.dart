import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource{

  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl));
  @override
  Future<RegisterResponse> register(RegisterRequest request) async{
    try{
      final response =
          await dio.post(ApiConstant.registerEndPoint, data: request.toJson());
      return RegisterResponse.fromJson(response.data);
    }catch(exception){
      String? message;
      if(exception is DioException){
       message = exception.response?.data["message"];
      }
      throw RemoteException(message: message ?? "Failed To Register");
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request)async {
   try {
      final response =
          await dio.post(ApiConstant.loginEndPoint, data: request.toJson());
      return LoginResponse.fromJson(response.data);
    }catch(exception){
     String? message;
     if(exception is DioException){
       message = exception.response?.data["message"];
     }
     throw RemoteException(message: message ?? "Failed To Login");
   }
  }
  
}