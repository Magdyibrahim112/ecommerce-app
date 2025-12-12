import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/use_cases/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ProductsCubit extends Cubit<ProductsState>{
  ProductsCubit({required this.productUseCase}):super(ProductInitial());
  ProductsUseCase productUseCase;
  void getProducts([String? categoryId])async{
    emit(ProductLoading());
    productUseCase(categoryId);
    var result = await productUseCase(categoryId);
    result.fold((failure){
      emit(ProductError(message: failure.message));
    }, (products){
      emit(ProductSuccess(products: products));
    });
  }
}
abstract class ProductsState{}
class ProductInitial extends ProductsState{}
class ProductSuccess extends ProductsState{
  List<ProductEntity> products;
  ProductSuccess({required this.products});

}
class ProductLoading extends ProductsState{}
class ProductError extends ProductsState{
  String message;
  ProductError({required this.message});
}