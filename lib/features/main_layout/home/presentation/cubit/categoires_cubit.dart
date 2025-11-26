import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class CategoriesCubit extends Cubit<CategoriesState>{
  CategoriesCubit({required this.categoriesUseCase}):super(CategoriesInitial());

 CategoriesUseCase categoriesUseCase;
  void getCategories()async{
    emit(CategoriesLoading());
    final result = await categoriesUseCase();
    result.fold((failure){
      emit(CategoriesError(message: failure.message));
    }, (categories){
      emit(CategoriesSuccess(categories: categories));
    });
  }
}

abstract class CategoriesState {}
class CategoriesInitial extends CategoriesState{}
class CategoriesSuccess extends CategoriesState{
  List<CategoryEntity> categories;
  CategoriesSuccess({required this.categories});
}

class CategoriesLoading extends CategoriesState{

}

class CategoriesError extends CategoriesState{
  String message;
  CategoriesError({required this.message});
}