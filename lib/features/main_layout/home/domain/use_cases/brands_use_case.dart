import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repository_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class BrandsUseCase{
  BrandsRepository brandsRepository;
  BrandsUseCase({required this.brandsRepository});
  Future<Either<Failure, List<BrandEntity>>> call(){
    return brandsRepository.getBrands();
  }
}