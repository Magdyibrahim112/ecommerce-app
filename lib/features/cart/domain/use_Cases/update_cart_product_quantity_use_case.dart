import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/cart_repository_contract/cart_repository.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class UpdateCartProductQuantityUseCase{
  CartRepository cartRepository;
  UpdateCartProductQuantityUseCase({required this.cartRepository});
  Future<Either<Failure, CartEntity>>call({required String productId, required String quantity}){
   return cartRepository.updateCartProductQuantity(productId: productId, quantity: quantity);
  }
}