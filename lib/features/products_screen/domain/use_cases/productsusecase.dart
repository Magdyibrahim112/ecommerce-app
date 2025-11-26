import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/Product_entity.dart';
import 'package:ecommerce_app/features/products_screen/presentation/products_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ProductsUseCase{
  ProductsRepository productsRepository;
  ProductsUseCase({required this.productsRepository});
  Future<Either<Failure, List<ProductEntity>>>call([String? categoryId]){
    return productsRepository.getProducts(categoryId);
  }
}