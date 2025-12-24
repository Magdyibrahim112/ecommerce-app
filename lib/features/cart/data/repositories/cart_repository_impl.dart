import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart';
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repositories.dart';
import 'package:injectable/injectable.dart';
@LazySingleton(as: CartRepository)

class CartRepositoryImpl implements CartRepository {
  CartRemoteDataSource remoteDataSource;
  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, void>> addToCart({required String productId, }) async{//required String token
    try{
      AuthSharedPrefsLocalDataSource  authSharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
      String token =await authSharedPrefsLocalDataSource.getToken();
     final response = await remoteDataSource.addToCart
       (productId: productId, token: token);
      return Right(null);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> getCart() async{
    try{
      AuthSharedPrefsLocalDataSource  authSharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
      String token =await authSharedPrefsLocalDataSource.getToken();
      final response = await remoteDataSource.getCart(token: token);
      return Right(response.cart.toCartEntity());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }


  @override
  Future<Either<Failure, CartEntity>> updateCartProductQuantity({required String productId, required String quantity}) async{
    try{
      AuthSharedPrefsLocalDataSource  authSharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
      String token =await authSharedPrefsLocalDataSource.getToken();
      final response = await remoteDataSource.updateCartProductQuantity
        (productId: productId, quantity: quantity, token: token);
      return Right(response.cart.toCartEntity());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }


  @override
  Future<Either<Failure, CartEntity>> deleteProductFromCart({required String productId,}) async{
     try{
       AuthSharedPrefsLocalDataSource  authSharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
       String token =await authSharedPrefsLocalDataSource.getToken();
      final response = await remoteDataSource.deleteProductFromCart(productId: productId, token: token);
      return Right(response.cart.toCartEntity());
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart() async{
        try{
          AuthSharedPrefsLocalDataSource  authSharedPrefsLocalDataSource = AuthSharedPrefsLocalDataSource();
          String token =await authSharedPrefsLocalDataSource.getToken();
      await remoteDataSource.clearCart(token: token);
      return Right(null);
    }on RemoteException catch(exception){
      return Left(Failure(message: exception.message));
    }
  }

  
}






// import 'package:dartz/dartz.dart';
// import 'package:ecommerce_app/core/errors/app_exceptions.dart';
// import 'package:ecommerce_app/core/errors/failure.dart';
// import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
// import 'package:ecommerce_app/features/cart/domain/entities/cart_entity.dart';
// import 'package:ecommerce_app/features/cart/domain/repositories/cart_repositories.dart';
//
// class CartRepositoryImpl implements CartRepository {
//
//   CartRemoteDataSource remoteDataSource;
//   CartRepositoryImpl({required this.remoteDataSource});
//
//   @override
//   Future<Either<Failure, void>> addToCart(String productId) async{
//     try{
//      await remoteDataSource.addToCart(productId);
//       return Right(null);
//     }on RemoteException catch(exception){
//       return Left(Failure(message: exception.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, CartEntity>> getCart() async{
//     try{
//       final response = await remoteDataSource.getCart();
//       return Right(response.cart.toCartEntity());
//     }on RemoteException catch(exception){
//       return Left(Failure(message: exception.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, CartEntity>> updateCartProductQuantity(String productId, String quantity) async{
//     try{
//       final response = await remoteDataSource.updateCartProductQuantity(
//           productId, quantity);
//       return Right(response.cart.toCartEntity());
//     }on RemoteException catch(exception){
//       return Left(Failure(message: exception.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, CartEntity>> deleteProductFromCart(String productId) async{
//     try{
//       final response = await remoteDataSource.deleteProductFromCart(productId);
//       return Right(response.cart.toCartEntity());
//     }on RemoteException catch(exception){
//       return Left(Failure(message: exception.message));
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> clearUserCart() async{
//     try{
//       await remoteDataSource.clearUserCart();
//       return Right(null);
//     }on RemoteException catch(exception){
//       return Left(Failure(message: exception.message));
//     }
//   }
//
// }