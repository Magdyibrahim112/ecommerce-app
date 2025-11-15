import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category.dart';

abstract class CategoriesRemoteDataSource{
  Future<Either<String, List<Category>>> getCategories();
}