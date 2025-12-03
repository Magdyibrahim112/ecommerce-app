import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/cateories_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories_contract/categories_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class CategoriesUseCase{
  CategoriesRepository categoriesRepository;
  CategoriesUseCase({required this.categoriesRepository});

  Future<Either<Failure, List<CategoryEntity>>>call(){
    return categoriesRepository.getCategories();
  }
}