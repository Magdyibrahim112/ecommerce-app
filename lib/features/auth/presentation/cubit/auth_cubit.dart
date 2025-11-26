import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/use_cses/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_cses/register_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase, required this.loginUseCase}) : super(InitialState());

  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  void login(LoginRequest request) async {
    emit(LoginLoading());
   final  result = await loginUseCase(request);
   result.fold((failure){
     emit(LoginError(message: failure.message));
   }, (user){
     emit(LoginSuccess());
   });
  }

  void register(RegisterRequest request) async {
    emit(RegisterLoading());
   final result = await registerUseCase(request);
   result.fold((failure){
     emit(RegisterError(message: failure.message));
   }, (user){
     emit( RegisterSuccess());
   });
  }

}

abstract class AuthState {}

class InitialState extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterError extends AuthState {
  String message;

  RegisterError({required this.message});
}

class RegisterSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {
  String message;

  LoginError({required this.message});
}

class LoginSuccess extends AuthState {}
