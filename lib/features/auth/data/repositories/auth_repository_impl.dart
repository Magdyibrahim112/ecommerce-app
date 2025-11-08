import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{

  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});
  @override
  Future<Either<String, LoginResponse>> login(LoginRequest request) {
   return authRemoteDataSource.login(request);
  }

  @override
  Future<Either<String, RegisterResponse>> register(RegisterRequest request) {
    return authRemoteDataSource.register(request);
  }

}