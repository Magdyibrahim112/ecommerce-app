import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';

abstract class CategoriesRepository{
  Future<Either<String, List<CategoryEntity>>>getCategories();
}