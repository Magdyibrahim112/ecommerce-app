import 'cart.dart';

class CartResponse {
  const CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartId,
    required this.cart,
  });

  factory CartResponse.fromJson(dynamic json) {
    return CartResponse(
        status: json['status'],
        numOfCartItems: json['numOfCartItems'],
        cartId: json['cartId'],
        cart: Cart.fromJson(json['data']));
  }
  final String status;
  final int numOfCartItems;
  final Cart cart;
  final String? cartId;
}
