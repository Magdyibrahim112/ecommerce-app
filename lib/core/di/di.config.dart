// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i873;
import 'package:ecommerce_app/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i255;
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i386;
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart'
    as _i804;
import 'package:ecommerce_app/features/auth/domain/use_cases/login_usecase.dart'
    as _i514;
import 'package:ecommerce_app/features/auth/domain/use_cases/register_usecase.dart'
    as _i193;
import 'package:ecommerce_app/features/auth/presentation/cubit/register_cubit.dart'
    as _i72;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_api_remote_datasource.dart'
    as _i151;
import 'package:ecommerce_app/features/main_layout/home/data/data_sources/categories_remote_datasource.dart'
    as _i353;
import 'package:ecommerce_app/features/main_layout/home/data/repositories/categories_repo_impl.dart'
    as _i58;
import 'package:ecommerce_app/features/main_layout/home/domain/repositories/categories_repository.dart'
    as _i16;
import 'package:ecommerce_app/features/main_layout/home/domain/use_cases/get_categories_usecase.dart'
    as _i149;
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
    gh.singleton<_i353.CategoriesRemoteDataSource>(
        () => _i151.CategoriesApiRemoteDataSource());
    gh.singleton<_i255.AuthRemoteDataSource>(
        () => _i873.AuthApiRemoteDataSource());
    gh.singleton<_i804.AuthRepository>(() => _i386.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i255.AuthRemoteDataSource>()));
    gh.singleton<_i16.CategoriesRepository>(() => _i58.CategoriesRepositoryImpl(
        categoriesRemoteDataSource: gh<_i353.CategoriesRemoteDataSource>()));
    gh.singleton<_i514.LoginUseCase>(
        () => _i514.LoginUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.singleton<_i193.RegisterUseCase>(() =>
        _i193.RegisterUseCase(authRepository: gh<_i804.AuthRepository>()));
    gh.singleton<_i72.AuthCubit>(() => _i72.AuthCubit(
          registerUseCase: gh<_i193.RegisterUseCase>(),
          loginUseCase: gh<_i514.LoginUseCase>(),
        ));
    gh.singleton<_i149.GetCategoriesUSeCase>(() => _i149.GetCategoriesUSeCase(
        categoriesRepository: gh<_i16.CategoriesRepository>()));
    gh.singleton<_i851.CategoriesCubit>(() => _i851.CategoriesCubit(
        getCategoriesUSeCase: gh<_i149.GetCategoriesUSeCase>()));
    return this;
  }
}
