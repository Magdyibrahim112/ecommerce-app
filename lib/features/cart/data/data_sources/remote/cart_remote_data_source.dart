// import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';
//
// abstract class CartRemoteDataSource {
//   Future<void> addToCart(String productId);
//   Future<CartResponse> getCart();
//   Future<CartResponse> updateCartProductQuantity(String productId, String quantity);
//   Future<CartResponse> deleteProductFromCart(String productId);
//   Future<void> clearUserCart();
// }
//

import 'package:ecommerce_app/features/cart/data/models/CartResponse.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart({required String productId, required String token});
  Future<CartResponse> getCart({required String token});
  Future<CartResponse> updateCartProductQuantity({
    required String productId,
    required String quantity,
    required String token,
  });
  Future<CartResponse> deleteProductFromCart(
      {required String productId, required String token});
  Future<void> clearCart({required String token});
}
