import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_remote_datasource.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: CategoriesRepository)
class CategoriesRepositoryImpl implements CategoriesRepository {
  CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepositoryImpl({required this.categoriesRemoteDataSource});

  @override
  Future<Either<String, List<CategoryEntity>>> getCategories() async {
    Either<String, List<Category>> result = await categoriesRemoteDataSource.getCategories();
    return result.fold((message) {
      return left(message);
    }, (categories) {
      return right(categories
          .map((category) =>category.toCategoryEntity())
          .toList());
    });


  }
}
