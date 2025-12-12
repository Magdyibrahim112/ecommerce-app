import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class AuthCubit extends Cubit<AuthState>{
  AuthCubit({required this.registerUseCase, required this.loginUseCase}):super(InitialState());

  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  void login(LoginRequest request)async {
    emit(LoginLoading());//begin loading
    final result = await loginUseCase(request);
    result.fold((failure){
      emit(LoginError(message: failure.message));//end loading(failure)
    }, (user){
      emit(LoginSuccess());//end loading(success)
    });
  }

  void register(RegisterRequest request)async{
    emit(RegisterLoading());//begin loading
    final result = await registerUseCase(request);
    result.fold((failure){
      emit(RegisterError(message: failure.message));//end loading(failure)
    }, (user){
      emit(RegisterSuccess());//end loading(success)
    });
  }
}
abstract class AuthState{}//this is super class
class InitialState extends AuthState {}
class RegisterLoading extends AuthState{}
class RegisterSuccess extends AuthState{}
class RegisterError extends AuthState{
  String message;
  RegisterError({required this.message});
}

class LoginLoading extends AuthState{}
class LoginSuccess extends AuthState{}
class LoginError extends AuthState{
  String message;
  LoginError({required this.message});
}

