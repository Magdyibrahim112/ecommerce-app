import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/presentation/cubit/register_cubit.dart';
import 'package:injectable/injectable.dart';
@singleton
class RegisterUseCase{
  AuthRepository authRepository;
  RegisterUseCase({required this.authRepository});
  Future<Either<String, RegisterResponse>> call(RegisterRequest request){
   return authRepository.register(request) ;
  }
}