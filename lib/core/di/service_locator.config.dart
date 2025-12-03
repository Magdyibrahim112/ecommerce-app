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
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auht_api_remote_data_source.dart'
    as _i852;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i255;
import 'package:ecommerce_app/features/auth/data/repositories_impl/auth_repository_impl.dart'
    as _i609;
import 'package:ecommerce_app/features/auth/domain/repositories_contract/auth_repository.dart'
    as _i545;
import 'package:ecommerce_app/features/auth/domain/use_cases/login_use_case.dart'
    as _i1044;
import 'package:ecommerce_app/features/auth/domain/use_cases/register_use_case.dart'
    as _i552;
import 'package:ecommerce_app/features/auth/presentation/cubit/auth_cubit.dart'
    as _i118;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_api_remote_data_source.dart'
    as _i720;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/brands_remote_data_source.dart'
    as _i1071;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categoires_api_remote_data_source.dart'
    as _i601;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/remote/categories_remote_data_source.dart'
    as _i35;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/brands_repository_impl.dart'
    as _i101;
import 'package:ecommerce_app/features/main_layout/home/data/repositories_impl/categories_repository_impl.dart'
    as _i105;
import 'package:ecommerce_app/features/main_layout/home/domain/repositories_contract/brands_repository.dart'
    as _i743;
import 'package:ecommerce_app/features/main_layout/home/domain/repositories_contract/categories_repository.dart'
    as _i933;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/brands_use_case.dart'
    as _i848;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/categories_use_case.dart'
    as _i317;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/brands_cubit.dart'
    as _i906;
import 'package:ecommerce_app/features/main_layout/home/presentation/cubit/categories_cubit.dart'
    as _i851;
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
    gh.lazySingleton<_i35.CategoriesRemoteDataSource>(
        () => _i601.CategoriesApiRemoteDataSource());
    gh.singleton<_i255.AuthRemoteDataSource>(
        () => _i852.AuthApiRemoteDataSource());
    gh.lazySingleton<_i1071.BrandsRemoteDataSource>(
        () => _i720.BrandsApiRemoteDataSource());
    gh.lazySingleton<_i933.CategoriesRepository>(() =>
        _i105.CategoriesRepositoryImpl(
            remoteDataSource: gh<_i35.CategoriesRemoteDataSource>()));
    gh.lazySingleton<_i743.BrandsRepository>(() => _i101.BrandsRepositoryImpl(
        remoteDataSource: gh<_i1071.BrandsRemoteDataSource>()));
    gh.singleton<_i545.AuthRepository>(() => _i609.AuthRepositoryImpl(
          remoteDataSource: gh<_i255.AuthRemoteDataSource>(),
          localDataSource: gh<_i1050.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i317.CategoriesUseCase>(() => _i317.CategoriesUseCase(
        categoriesRepository: gh<_i933.CategoriesRepository>()));
    gh.singleton<_i1044.LoginUseCase>(
        () => _i1044.LoginUseCase(authRepository: gh<_i545.AuthRepository>()));
    gh.singleton<_i552.RegisterUseCase>(() =>
        _i552.RegisterUseCase(authRepository: gh<_i545.AuthRepository>()));
    gh.lazySingleton<_i851.CategoriesCubit>(() => _i851.CategoriesCubit(
        categoriesUseCase: gh<_i317.CategoriesUseCase>()));
    gh.singleton<_i118.AuthCubit>(() => _i118.AuthCubit(
          registerUseCase: gh<_i552.RegisterUseCase>(),
          loginUseCase: gh<_i1044.LoginUseCase>(),
        ));
    gh.lazySingleton<_i848.BrandsUseCase>(() =>
        _i848.BrandsUseCase(brandsRepository: gh<_i743.BrandsRepository>()));
    gh.lazySingleton<_i906.BrandsCubit>(
        () => _i906.BrandsCubit(brandsUseCase: gh<_i848.BrandsUseCase>()));
    return this;
  }
}
