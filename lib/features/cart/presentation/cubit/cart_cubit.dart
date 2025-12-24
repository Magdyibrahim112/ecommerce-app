import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/add_to_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/clear_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/delete_product_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart_use_case.dart';
import 'package:ecommerce_app/features/cart/domain/use_cases/update_cart_product_quantity_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class CartCubit extends Cubit<CartState> {
  CartCubit({
    required this.addToCartUseCase,
    required this.getCartUseCase,
    required this.updateCartProductQuantityUseCase,
    required this.deleteProductFromCartUseCase,
    required this.clearCartUseCase,
  }) : super(CartInitial());

  AddToCartUseCase addToCartUseCase;
  GetCartUseCase getCartUseCase;
  UpdateCartProductQuantityUseCase updateCartProductQuantityUseCase;
  DeleteProductFromCartUseCase deleteProductFromCartUseCase;
  ClearCartUseCase clearCartUseCase;
  late CartEntity cart; // عشان اجيب بية ال cart

 Future< void> addToCart({required String productId}) async {
    emit(AddToCartLoading());
    var result = await addToCartUseCase(productId: productId);
    result.fold((failure) {
      emit(AddToCartError(message: failure.message));
    }, (_) {
      emit(AddToCartSuccess());
    });
  }

  // fold(Left,Right)
  void getCart() async {
    emit(GetCartLoading());
    var result = await getCartUseCase();
    result.fold((failure) {
      emit(GetCartError(message: failure.message));
    }, (cart) {
      this.cart = cart;
      emit(GetCartSuccess());
    });
  }

  void updateCartProduct(
      {required String productId, required String quantity}) async {
    emit(UpdateCartProductQuantityLoading());
    var result = await updateCartProductQuantityUseCase(
        productId: productId, quantity: quantity);
    result.fold((failure) {
      emit(UpdateCartProductQuantityError(message: failure.message));
    }, (cart) {
      this.cart = cart;// return a cart after updated
      emit(UpdateCartProductQuantitySuccess());
    });
  }

  void deleteProductFromCart({required String productId}) async {
    emit(DeleteProductQuantityFromCartLoading());
    var result = await deleteProductFromCartUseCase(productId: productId);
    result.fold((failure) {
      emit(DeleteProductQuantityFromCartError(message: failure.message));
    }, (cart) {
      this.cart = cart;
      emit(DeleteProductQuantityFromCartSuccess());
    });
  }
  // void clearCart() async {
  //   emit(ClearCartLoading());
  //   var result = await clearCartUseCase();
  //   result.fold((failure) {
  //     emit(ClearCartError(message: failure.message));
  //   }, (cart) {
  //     emit(ClearCartSuccess());
  //   });
  // }
}

abstract class CartState {} //this is super class

class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  String message;
  AddToCartError({required this.message});
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {
  String message;
  GetCartError({required this.message});
}

class UpdateCartProductQuantityLoading extends CartState {}

class UpdateCartProductQuantitySuccess extends CartState {}

class UpdateCartProductQuantityError extends CartState {
  String message;
  UpdateCartProductQuantityError({required this.message});
}

class DeleteProductQuantityFromCartLoading extends CartState {}

class DeleteProductQuantityFromCartSuccess extends CartState {}

class DeleteProductQuantityFromCartError extends CartState {
  String message;
  DeleteProductQuantityFromCartError({required this.message});
}

// class ClearCartLoading extends CartStates {}
//
// class ClearCartSuccess extends CartStates {}
//
// class ClearCartError extends CartStates {
//   String message;
//   ClearCartError({required this.message});
// }
