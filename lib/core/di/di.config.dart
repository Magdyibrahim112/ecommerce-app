// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_loacal_data_source.dart'
    as _i38;
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart'
    as _i485;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i873;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i255;
import 'package:ecommerce_app/features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i609;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i804;
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart'
    as _i1044;
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart'
    as _i552;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_api_remote_data_source.dart'
    as _i934;
import 'package:ecommerce_app/features/cart/data/data_sources/remote/cart_remote_data_source.dart'
    as _i1015;
import 'package:ecommerce_app/features/cart/data/repositories/cart_repository_impl.dart'
    as _i84;
import 'package:ecommerce_app/features/cart/domain/repositories/cart_repositories.dart'
    as _i372;
import 'package:ecommerce_app/features/cart/domain/use_cases/add_to_cart_use_case.dart'
    as _i350;
import 'package:ecommerce_app/features/cart/domain/use_cases/clear_cart_use_case.dart'
    as _i916;
import 'package:ecommerce_app/features/cart/domain/use_cases/delete_product_use_case.dart'
    as _i303;
import 'package:ecommerce_app/features/cart/domain/use_cases/get_cart_use_case.dart'
    as _i901;
import 'package:ecommerce_app/features/cart/domain/use_cases/update_cart_product_quantity_use_case.dart'
    as _i61;
import 'package:ecommerce_app/features/cart/presentation/cubit/cart_cubit.dart'
    as _i390;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_api_remote_data_source.dart'
    as _i720;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_remote_data_source.dart'
    as _i1071;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_api_remote_data_source.dart'
    as _i77;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart'
    as _i35;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/brands_repository_impl.dart'
    as _i101;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/categories_repository_impl.dart'
    as _i105;
import 'package:ecommerce_app/features/main_layout/home/domain/repository_contract/brands_repository.dart'
    as _i546;
import 'package:ecommerce_app/features/main_layout/home/domain/repository_contract/categories_repository.dart'
    as _i377;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/brands_use_case.dart'
    as _i848;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/categories_use_case.dart'
    as _i317;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brands_cubit.dart'
    as _i906;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/categories_cubit.dart'
    as _i851;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_api_remote_data_source.dart'
    as _i302;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart'
    as _i1062;
import 'package:ecommerce_app/features/products_screen/data/repositories_impl/products_repository_impl.dart'
    as _i143;
import 'package:ecommerce_app/features/products_screen/domain/repositories/products_repository.dart'
    as _i981;
import 'package:ecommerce_app/features/products_screen/domain/use_cases/product_use_case.dart'
    as _i53;
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart'
    as _i829;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i38.AuthLocalDataSource>(
        () => _i485.AuthSharedPrefsLocalDataSource());
    gh.singleton<_i255.AuthRemoteDataSource>(
        () => _i873.AuthApiRemoteDataSource());
    gh.lazySingleton<_i1071.BrandsRemoteDataSource>(
        () => _i720.BrandsApiRemoteDataSource());
    gh.lazySingleton<_i35.CategoriesRemoteDataSource>(
        () => _i77.CategoriesApiRemoteDataSource());
    gh.lazySingleton<_i1015.CartRemoteDataSource>(
        () => _i934.CartApiRemoteDataSource());
    gh.lazySingleton<_i1062.ProductsRemoteDataSource>(
        () => _i302.ProductsApiRemoteDataSource());
    gh.singleton<_i804.AuthRepository>(() => _i609.AuthRepositoryImpl(
          authApiRemoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          localDataSource: gh<_i38.AuthLocalDataSource>(),
        ));
    gh.singleton<_i1044.LoginUseCase>(
        () => _i1044.LoginUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.singleton<_i552.RegisterUseCase>(() =>
        _i552.RegisterUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.lazySingleton<_i981.ProductsRepository>(() =>
        _i143.ProductsRepositoryImpl(
            remoteDataSource: gh<_i1062.ProductsRemoteDataSource>()));
    gh.lazySingleton<_i372.CartRepository>(() => _i84.CartRepositoryImpl(
        remoteDataSource: gh<_i1015.CartRemoteDataSource>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          registerUseCase: gh<_i552.RegisterUseCase>(),
          loginUseCase: gh<_i1044.LoginUseCase>(),
        ));
    gh.lazySingleton<_i350.AddToCartUseCase>(() =>
        _i350.AddToCartUseCase(cartRepository: gh<_i372.CartRepository>()));
    gh.lazySingleton<_i916.ClearCartUseCase>(() =>
        _i916.ClearCartUseCase(cartRepository: gh<_i372.CartRepository>()));
    gh.lazySingleton<_i303.DeleteProductFromCartUseCase>(() =>
        _i303.DeleteProductFromCartUseCase(
            cartRepository: gh<_i372.CartRepository>()));
    gh.lazySingleton<_i901.GetCartUseCase>(
        () => _i901.GetCartUseCase(cartRepository: gh<_i372.CartRepository>()));
    gh.lazySingleton<_i61.UpdateCartProductQuantityUseCase>(() =>
        _i61.UpdateCartProductQuantityUseCase(
            cartRepository: gh<_i372.CartRepository>()));
    gh.lazySingleton<_i546.BrandsRepository>(() => _i101.BrandsRepositoryImpl(
        remoteDataSource: gh<_i1071.BrandsRemoteDataSource>()));
    gh.lazySingleton<_i377.CategoriesRepository>(() =>
        _i105.CategoriesRepositoryImpl(
            remoteDataSource: gh<_i35.CategoriesRemoteDataSource>()));
    gh.lazySingleton<_i317.CategoriesUseCase>(() => _i317.CategoriesUseCase(
        categoriesRepository: gh<_i377.CategoriesRepository>()));
    gh.lazySingleton<_i53.ProductsUseCase>(() => _i53.ProductsUseCase(
        productsRepository: gh<_i981.ProductsRepository>()));
    gh.lazySingleton<_i390.CartCubit>(() => _i390.CartCubit(
          addToCartUseCase: gh<_i350.AddToCartUseCase>(),
          getCartUseCase: gh<_i901.GetCartUseCase>(),
          updateCartProductQuantityUseCase:
              gh<_i61.UpdateCartProductQuantityUseCase>(),
          deleteProductFromCartUseCase:
              gh<_i303.DeleteProductFromCartUseCase>(),
          clearCartUseCase: gh<_i916.ClearCartUseCase>(),
        ));
    gh.lazySingleton<_i848.BrandsUseCase>(() =>
        _i848.BrandsUseCase(brandsRepository: gh<_i546.BrandsRepository>()));
    gh.lazySingleton<_i851.CategoriesCubit>(() => _i851.CategoriesCubit(
        categoriesUseCase: gh<_i317.CategoriesUseCase>()));
    gh.factory<_i829.ProductsCubit>(
        () => _i829.ProductsCubit(productUseCase: gh<_i53.ProductsUseCase>()));
    gh.lazySingleton<_i906.BrandsCubit>(() =>
        _i906.BrandsCubit(brandsUseCaseUseCase: gh<_i848.BrandsUseCase>()));
    return this;
  }
}
