import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_remote_datasource.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/CategoriesResponse.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/category.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: CategoriesRemoteDataSource)
class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource{
  
  Dio dio = Dio(BaseOptions(baseUrl: ApiConstant.baseURL));
  @override
  Future<Either<String, List<Category>>> getCategories() async{
    var response = await dio.get(ApiConstant.categoriesEndPoint);
   CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(response.data);
   return right(categoriesResponse.categories);

  }
  
}