import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/repositories_contract/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  AuthRepository authRepository;

  void register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await authRepository.register(request);
    result.fold((failure) {
      emit(RegisterError(message: failure.message));
    }, (user) {
      emit(RegisterSuccess());
    });
  }

  void login(LoginRequest request) async {
    emit(LoginLoading());
    var result = await authRepository.login(request);
    result.fold((failure) {
      emit(LoginError(message: failure.message));
    }, (user) {
      emit(LoginSuccess());
    });
  }
}


abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterError extends AuthState {
  String message;

  RegisterError({required this.message});
}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginError extends AuthState {
  String message;

  LoginError({required this.message});
}
