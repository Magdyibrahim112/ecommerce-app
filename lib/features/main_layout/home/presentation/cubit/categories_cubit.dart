import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_categories_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@singleton
class CategoriesCubit extends Cubit<CategoriesState>{
  CategoriesCubit({required this.getCategoriesUSeCase}):super(CategoriesInitial());
  GetCategoriesUSeCase getCategoriesUSeCase;

  void getCategories()async{
    emit(CategoriesLoading());
    var result = await getCategoriesUSeCase();
    result.fold((errorMessage){
     emit(CategoriesError(message: errorMessage));

    }, (categoriesList){
      emit(CategoriesSuccess(categories: categoriesList));
    });
  }


}


abstract class CategoriesState{}
class CategoriesInitial extends CategoriesState{}
class CategoriesLoading extends CategoriesState{}
class CategoriesError extends CategoriesState{
  String message;
  CategoriesError({required this.message});
}

class CategoriesSuccess extends CategoriesState{
  List<CategoryEntity> categories;
  CategoriesSuccess({required this.categories});
}