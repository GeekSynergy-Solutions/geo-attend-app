import 'package:geoattend/infrastructure/httpClient/interceptors/geo_location_auth_interceptor.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class GeoLocationHttpClient {
  @lazySingleton
  InterceptedClient get httpClient => InterceptedClient.build(
        interceptors: [
          getIt<GeoLocationAuthInterceptor>(),
        ],
        requestTimeout: const Duration(milliseconds: 500000),
      );
}
