import 'package:geoattend/data/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthenticationInterceptor extends Interceptor {
  final AppSharedPreferences appSharedPreferences;
  final AppFlutterSecureStorage appFlutterSecureStorage;
  AuthenticationInterceptor(this.appSharedPreferences, this.appFlutterSecureStorage,);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers[APIEndPointsParameter.authHeader] != null) {
      var token = await appFlutterSecureStorage.readLoginToken();
      options.headers[APIEndPointsParameter.authHeader] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
