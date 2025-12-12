import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_loacal_data_source.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/User.dart';
import 'package:ecommerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRemoteDataSource authApiRemoteDataSource;
  AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({required this.authApiRemoteDataSource,
    required this.localDataSource});
  // right => success
  // left => failure
  @override
  Future<Either<Failure,UserEntity>> register(RegisterRequest request) async{
    try{
      final response = await authApiRemoteDataSource.register(request);
      await localDataSource.saveToken(response.token);
      return Right(response.user.toUserEntity());
    }on AppException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure,UserEntity>> login(LoginRequest request) async{
    try{
      final response = await authApiRemoteDataSource.login(request);
      await localDataSource.saveToken(response.token!);
      return Right(response.user!.toUserEntity());
    }on AppException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }
}

// T => template parameter

// abstract class Result{}
// class SuccessResult<T> extends Result{
//   T data;
//   SuccessResult({required this.data});
// }
// class FailureResult<T> extends Result{
//   String message;
//   FailureResult({required this.message});
// }
