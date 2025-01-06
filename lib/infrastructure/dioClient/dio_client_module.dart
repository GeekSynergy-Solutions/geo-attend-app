import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/infrastructure/dioClient/interceptors/network_interceptor.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'interceptors/authentication_interceptor.dart';

@module
abstract class DioClientModule {
  @lazySingleton
  Dio get dioClient => Dio(
        BaseOptions(
          baseUrl: APIEndPoints.baseURL,
        ),
      )..interceptors.addAll(
          [getIt<NetworkInterceptor>(), getIt<AuthenticationInterceptor>()]);

  @injectable
  Connectivity get connectivity => Connectivity();
}
