import 'package:ecommerce_app/features/cart/domain/entities/cart_item_entity.dart';

class CartEntity{
  CartEntity({

    required this.cartItems,
    required this.totalCartPrice
});
  final List<CartItemEntity> cartItems ;
  final int totalCartPrice;


}