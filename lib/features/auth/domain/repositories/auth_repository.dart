import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:ecommerce_app/features/auth/data/models/RegisterResponse.dart';

abstract class AuthRepository{
  Future<Either<String, RegisterResponse>> register(RegisterRequest request);
  Future<Either<String, LoginResponse>> login(LoginRequest request);
}