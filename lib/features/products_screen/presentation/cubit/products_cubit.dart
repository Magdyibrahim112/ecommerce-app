import 'package:ecommerce_app/features/products_screen/domain/entities/Product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_cases/productsusecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit({required this.productsUseCase}) :super(ProductsInitial());
  ProductsUseCase productsUseCase;

  void getProducts([String? categoryId]) async {
    emit(ProductsLoading());
    var result = await productsUseCase(categoryId);
    result.fold((failure) {
      emit(ProductsError(message: failure.message));
    }, (products) {
      emit(ProductsSuccess(products: products));
    });
  }
}

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsSuccess extends ProductsState {
  List<ProductEntity> products;

  ProductsSuccess({required this.products});
}

class ProductsLoading extends ProductsState {}

class ProductsError extends ProductsState {
  String message;

  ProductsError({required this.message});
}