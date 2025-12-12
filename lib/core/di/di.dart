// import 'package:get_it/get_it.dart';
// import 'package:injectable/injectable.dart';
//
// /// di=> summary of dependency injection
// import 'di.config.dart';
//
// final getIt = GetIt.instance;
//
// void configureDependencies() => getIt.init();

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  // initializerName: r'$initGetIt',
  // preferRelativeImports: true,
  // asExtension: false,
)
void configureDependencies() => getIt.init();
