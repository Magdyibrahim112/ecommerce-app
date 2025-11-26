import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/brands_use_case.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/categories_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class BrandsCubit extends Cubit<BrandsState>{
  BrandsCubit({required this.brandsUseCase}):super(BrandsInitial());
   BrandsUseCase brandsUseCase;
  void getBrands()async{
    emit(BrandsLoading());
    final result = await brandsUseCase();
    result.fold((failure){
      emit(BrandsError(message: failure.message));
    }, (brands){
      emit(BrandsSuccess(brands: brands));
    });
  }
}

abstract class BrandsState {}
class BrandsInitial extends BrandsState{}
class BrandsSuccess extends BrandsState{
  List<BrandEntity> brands;
  BrandsSuccess({required this.brands});
}

class BrandsLoading extends BrandsState{

}

class BrandsError extends BrandsState{
  String message;
  BrandsError({required this.message});
}