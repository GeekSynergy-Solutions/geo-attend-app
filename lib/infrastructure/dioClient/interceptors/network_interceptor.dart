import 'dart:io';

import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/infrastructure/dioClient/connectivityManager/model/connection.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';

@lazySingleton
class NetworkInterceptor extends Interceptor {
  NetworkInterceptor(
    this._connection,
  );
  final Connection _connection;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      final isInternetEnabled = await _connection.isInternetEnabled();
      if (isInternetEnabled) return handler.next(options);
      handler.reject(
        DioException(
          requestOptions: options,
          message: internetErrorResponse.errorMessage,
          type: DioExceptionType.connectionError,
          response: Response(
            requestOptions: options,
            data: {
              'message': internetErrorResponse.errorMessage,
            },
            statusCode: internetErrorResponse.statusCode,
          ),
        ),
        // true,
      );
    } on SocketException catch (ex) {
      throw FormatException(ex.message);
    } on DioException catch (ex) {
      throw FormatException(ex.message ?? 'Unknown error occured');
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    GeneralFunctions.outputDebugMessage(err.message ?? '');
    return handler.reject(err);
  }
}
