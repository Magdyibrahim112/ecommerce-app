import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repository.dart';
import 'package:injectable/injectable.dart';

import '../entities/category_entity.dart';
@singleton
class GetCategoriesUSeCase{
  CategoriesRepository categoriesRepository;
  GetCategoriesUSeCase({required this.categoriesRepository});

  Future<Either<String, List<CategoryEntity>>> call(){
    return categoriesRepository.getCategories();
  }
}