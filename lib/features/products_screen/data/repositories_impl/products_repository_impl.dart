import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce_app/features/products_screen/domain/entities/product_entity.dart';
import 'package:ecommerce_app/features/products_screen/domain/repositories_contrract/products_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as:ProductsRepository )
class ProductsRepositoryImpl implements ProductsRepository{
  ProductsRemoteDataSource remoteDataSources;
  ProductsRepositoryImpl({required this.remoteDataSources});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts({String? productId})async {
    try{
      final response =
          await remoteDataSources.getProducts(productId: productId);
      return Right(response.products
          .map((product) => product.toProductEntity())
          .toList());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

}