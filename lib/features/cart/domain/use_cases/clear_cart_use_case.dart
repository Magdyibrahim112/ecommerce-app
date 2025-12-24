import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repositories.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ClearCartUseCase{
  CartRepository cartRepository;
  ClearCartUseCase({required this.cartRepository});
  Future<Either<Failure, void>> call() {
    return cartRepository.clearCart();
  }
}
