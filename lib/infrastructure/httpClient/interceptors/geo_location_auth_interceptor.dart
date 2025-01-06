import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
// ignore: implementation_imports
import 'package:http/src/base_request.dart';
// ignore: implementation_imports
import 'package:http/src/base_response.dart';
import 'package:http_interceptor/models/interceptor_contract.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GeoLocationAuthInterceptor implements InterceptorContract {
  GeoLocationAuthInterceptor();

  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    if (request.headers[APIEndPointsParameter.authHeader] != null) {
      String token = APIEndPoints.hereAuthApiKey;
      debugPrint('here is the token ${request.url} $token');
      request.headers[APIEndPointsParameter.authHeader] = 'Bearer $token';
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}
