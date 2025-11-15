import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  Dio dio = Dio(BaseOptions(
    baseUrl: ApiConstant.baseURL,
  ));

  @override
  Future<Either<String, RegisterResponse>> register(
      RegisterRequest request) async {

      var response =
          await dio.post(ApiConstant.signUpEndPoint, data: request.toJson());
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(response.data);
      return right(registerResponse);

  }

  @override
  Future<Either<String, LoginResponse>> login(LoginRequest request) async{
   var response = await dio.post(ApiConstant.singInEndPoint, data: request.toJson());
   LoginResponse loginResponse = LoginResponse.fromJson(response.data);
   return right(loginResponse);
  }
}
