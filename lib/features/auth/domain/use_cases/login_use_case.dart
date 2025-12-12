import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/domain/entites/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton()
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure,UserEntity>>call(LoginRequest request){
    return authRepository.login(request);
  }
}

