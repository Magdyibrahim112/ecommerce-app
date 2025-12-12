import 'package:ecommerce_app/features/main_layout/home/data/models/category_response/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';
//@lazySingleton
abstract class CategoriesRemoteDataSource{
  Future<CategoriesResponse> getCategories();
}