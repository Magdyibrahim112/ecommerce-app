import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:ecommerce_app/features/auth/domain/repositories_contract/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});


  Future<Either<Failure, UserEntity>>call(RegisterRequest request){
    return authRepository.register(request);
  }
}