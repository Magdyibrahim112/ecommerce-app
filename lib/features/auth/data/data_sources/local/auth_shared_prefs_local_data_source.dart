import 'package:ecommerce_app/core/errors/app_exceptions.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsLocalDataSource implements AuthLocalDataSource {
  @override
  Future<String> getToken() async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString(CacheConstant.tokenKey)!;
    } catch (exception) {
      throw LocalException(message: "Failed To Get Token");
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      SharedPreferences sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString(CacheConstant.tokenKey, token);
    } catch (exception) {
      throw LocalException(message: "FailedTo Save Token");
    }
  }
}
