import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  final int totalCartPrice;
  // final String? id;
  // final String? cartOwner;

  CartEntity({required this.cartItems,
    required this.totalCartPrice,
    // required this.id,
    // required this.cartOwner
  });
}


