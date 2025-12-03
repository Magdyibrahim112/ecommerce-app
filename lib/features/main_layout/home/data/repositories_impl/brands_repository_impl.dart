import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exception.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_remote_data_source.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/entities/brand_entity.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/repositories_contract/brands_repository.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository{

 BrandsRemoteDataSource remoteDataSource;
 BrandsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async{
    try{
      final response = await remoteDataSource.getBrands();
      return Right(
          response.brands.map((brand) => brand.toBrandEntity()).toList());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

}