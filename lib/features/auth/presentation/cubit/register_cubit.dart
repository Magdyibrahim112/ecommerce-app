import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  AuthRepository authRepository;

 void  register(RegisterRequest request) async {
    emit(RegisterLoading());
    var result = await authRepository.register(request);
    result.fold((error) {
      emit(RegisterError(errorMessage: error));
    }, (registerResponse) {
      emit(RegisterSuccess());
    });
  }


  void login(LoginRequest request)async{
   emit(LoginLoading());
    var result = await authRepository.login(request);
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
