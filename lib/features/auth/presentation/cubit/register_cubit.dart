import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login_usecase.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/register_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.registerUseCase, required this.loginUseCase}) : super(AuthInitial());
 RegisterUseCase registerUseCase;
 LoginUseCase loginUseCase;

 void  register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await registerUseCase(request);
    result.fold((error) {
      emit(RegisterError(errorMessage: error));
    }, (registerResponse) {
      emit(RegisterSuccess());
    });
  }


  void login(LoginRequest request)async{
   emit(LoginLoading());
    var result = await loginUseCase(request);
    result.fold((error){
      emit(LoginError(errorMessage: error));
    }, (loginResponse){
      emit(LoginSuccess());
    });
  }
}





abstract class AuthState {}

class AuthInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterError extends AuthState {
  String errorMessage;

  RegisterError({required this.errorMessage});
}

class RegisterSuccess extends AuthState {}

class LoginLoading extends AuthState{}
class LoginError extends AuthState{
  String errorMessage;
  LoginError({required this.errorMessage});
}

class LoginSuccess extends AuthState{

}
