// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i1050;
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_shared_prefs_local_data_source.dart'
    as _i485;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i873;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i255;
import 'package:ecommerce_app/features/auth/data/repositories_impl/auth_repositroy_impl.dart'
    as _i588;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i804;
import 'package:ecommerce_app/features/auth/domain/use_cses/login_use_case.dart'
    as _i680;
import 'package:ecommerce_app/features/auth/domain/use_cses/register_use_case.dart'
    as _i465;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
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
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/categoires_cubit.dart'
    as _i826;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_api_remote_data_source.dart'
    as _i302;
import 'package:ecommerce_app/features/products_screen/data/data_sources/remote/products_remote_data_source.dart'
    as _i1062;
import 'package:ecommerce_app/features/products_screen/data/repositories_impl/products_repository_impl.dart'
    as _i143;
import 'package:ecommerce_app/features/products_screen/domain/use_cases/productsusecase.dart'
    as _i465;
import 'package:ecommerce_app/features/products_screen/presentation/cubit/products_cubit.dart'
    as _i829;
import 'package:ecommerce_app/features/products_screen/presentation/products_repository.dart'
    as _i850;
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
    gh.singleton<_i1050.AuthLocalDataSource>(
        () => _i485.AuthSharedPrefsLocalDataSource());
    gh.singleton<_i255.AuthRemoteDataSource>(
        () => _i873.AuthApiRemoteDataSource());
    gh.lazySingleton<_i1071.BrandsRemoteDataSource>(
        () => _i720.BrandsApiRemoteDataSource());
    gh.lazySingleton<_i35.CategoriesRemoteDataSource>(
        () => _i77.CategoriesApiRemoteDataSource());
    gh.lazySingleton<_i1062.ProductsRemoteDataSource>(
        () => _i302.ProductsApiRemoteDataSource());
    gh.lazySingleton<_i546.BrandsRepository>(() => _i101.BrandsRepositoryImpl(
        remoteDataSource: gh<_i1071.BrandsRemoteDataSource>()));
    gh.lazySingleton<_i377.CategoriesRepository>(() =>
        _i105.CategoriesRepositoryImpl(
            remoteDataSource: gh<_i35.CategoriesRemoteDataSource>()));
    gh.lazySingleton<_i850.ProductsRepository>(() =>
        _i143.ProductsRepositoryImpl(
            remoteDataSource: gh<_i1062.ProductsRemoteDataSource>()));
    gh.lazySingleton<_i317.CategoriesUseCase>(() => _i317.CategoriesUseCase(
        categoriesRepository: gh<_i377.CategoriesRepository>()));
    gh.singleton<_i804.AuthRepository>(() => _i588.AuthRepositoryImpl(
          authApiRemoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          localDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i826.CategoriesCubit>(() => _i826.CategoriesCubit(
        categoriesUseCase: gh<_i317.CategoriesUseCase>()));
    gh.singleton<_i680.LoginUseCase>(
        () => _i680.LoginUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.singleton<_i465.RegisterUseCase>(() =>
        _i465.RegisterUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.lazySingleton<_i848.BrandsUseCase>(() =>
        _i848.BrandsUseCase(brandsRepository: gh<_i546.BrandsRepository>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          registerUseCase: gh<_i465.RegisterUseCase>(),
          loginUseCase: gh<_i680.LoginUseCase>(),
        ));
    gh.lazySingleton<_i465.ProductsUseCase>(() => _i465.ProductsUseCase(
        productsRepository: gh<_i850.ProductsRepository>()));
    gh.lazySingleton<_i906.BrandsCubit>(
        () => _i906.BrandsCubit(brandsUseCase: gh<_i848.BrandsUseCase>()));
    gh.factory<_i829.ProductsCubit>(() =>
        _i829.ProductsCubit(productsUseCase: gh<_i465.ProductsUseCase>()));
    return this;
  }
}
