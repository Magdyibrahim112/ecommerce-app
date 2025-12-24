import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepository {
  Future<Either<Failure, void>> addToCart({
    required String productId,
  }); //required String token
  Future<Either<Failure, CartEntity>> getCart();
  Future<Either<Failure, CartEntity>> updateCartProductQuantity({
    required String productId,
    required String quantity,
  });
  Future<Either<Failure, CartEntity>> deleteProductFromCart({required String productId});
  Future<Either<Failure, void>> clearCart();
}

// // import 'package:dartz/dartz.dart';
// // import 'package:ecommerce_app/core/errors/failure.dart';
// // import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
// //
// // abstract class CartRepository{
// //   Future<void> addToCart(String productId);
// //   Future<Either<Failure, CartEntity>> getCart();
// //   Future<Either<Failure, CartEntity>> updateCartProductQuantity(String productId, String quantity);
// //   Future<Either<Failure, CartEntity>> deleteProductFromCart(String productId);
// //   Future<void> clearUserCart();
// // }
//
// // lib/features/cart/domain/repositories/cart_repositories.dart
//
// import 'package:dartz/dartz.dart';
// import 'package:ecommerce_app/core/errors/failure.dart';
// import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
//
// abstract class CartRepository{
//   Future<Either<Failure, void>> addToCart(String productId);
//   Future<Either<Failure, CartEntity>> getCart();
//   Future<Either<Failure, CartEntity>> updateCartProductQuantity(String productId, String quantity);
//   Future<Either<Failure, CartEntity>> deleteProductFromCart(String productId);
//   Future<Either<Failure, void>> clearUserCart();
// }
