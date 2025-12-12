import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository_contract/categories_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRemoteDataSource remoteDataSource;
  CategoriesRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try{
      final response = await remoteDataSource.getCategories();
      return Right(response.categories
          .map((category) => category.toCategoryEntity())
          .toList());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }
}
