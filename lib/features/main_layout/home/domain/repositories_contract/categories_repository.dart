import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';

import '../entities/cateories_entity.dart';

abstract class CategoriesRepository{
  Future<Either<Failure, List<CategoryEntity>>>getCategories();
}