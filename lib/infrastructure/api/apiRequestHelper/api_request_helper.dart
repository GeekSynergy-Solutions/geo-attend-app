import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/entity/response/generalRemoteServerResponse/general_remote_server_response.dart';
import 'package:geoattend/domain/entity/response/successData/success_data_response.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/networkRequestMsgErrorStatusCodeConstantValueClass/network_request_error_msg_status_code_constant_value_class.dart';
import 'package:path_provider/path_provider.dart';

@injectable
class ApiRequestHelper {
  Dio dio;
  Connectivity connectivity;
  RetrieveFailedResponseClass retrieveFailedResponse;
  ApiRequestHelper(
    this.connectivity,
    this.dio,
    this.retrieveFailedResponse,
  );

  Future<Either<FailureResponse, Map<String, dynamic>>> postRequest(
    String endPoint, {
    required bool isRequestAuthorized,
    Map<String, dynamic>? jsonData,
    bool isDataRequired = false,
  }) async {
    dynamic postRequestResponse;
    Options options = Options(
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      if (isDataRequired == true) {
        postRequestResponse = await dio.post(endPoint,
            data: jsonEncode(jsonData), options: options);
      } else {
        postRequestResponse = await dio.post(endPoint, options: options);
      }
    } on SocketException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      postRequestResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: postRequestResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: postRequestResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> putRequest(
    String endPoint, {
    required bool isRequestAuthorized,
    Map<String, dynamic>? jsonData,
    bool isDataRequired = false,
  }) async {
    dynamic putRequestResponse;
    Options options = Options(
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      if (isDataRequired == true) {
        putRequestResponse = await dio.put(endPoint,
            data: jsonEncode(jsonData), options: options);
      } else {
        putRequestResponse = await dio.put(endPoint, options: options);
      }
    } on SocketException catch (e) {
      putRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      putRequestResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: putRequestResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
        apiRequestResponse: putRequestResponse);
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> postRequestWithFormData(
    String endPoint, {
    required FormData formData,
    required bool isRequestAuthorized,
  }) async {
    dynamic postRequestWithFormDataResponse;
    Options options = Options(
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      postRequestWithFormDataResponse =
          await dio.post(endPoint, data: formData, options: options);
    } on SocketException catch (e) {
      postRequestWithFormDataResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      postRequestWithFormDataResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: postRequestWithFormDataResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
        apiRequestResponse: postRequestWithFormDataResponse);
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> putRequestWithFormData(
    String endPoint, {
    required FormData formData,
    required bool isRequestAuthorized,
  }) async {
    dynamic postRequestWithFormDataResponse;
    Options options = Options(
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      postRequestWithFormDataResponse =
          await dio.put(endPoint, data: formData, options: options);
    } on SocketException catch (e) {
      postRequestWithFormDataResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      postRequestWithFormDataResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: postRequestWithFormDataResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
        apiRequestResponse: postRequestWithFormDataResponse);
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> patchRequest(
    String endPoint, {
    required bool isRequestAuthorized,
    Map<String, dynamic>? jsonData,
    bool isDataRequired = false,
  }) async {
    dynamic patchRequestResponse;
    Options options = Options(
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      if (isDataRequired == true) {
        patchRequestResponse = await dio.patch(endPoint,
            data: jsonEncode(jsonData), options: options);
      } else {
        patchRequestResponse = await dio.patch(endPoint, options: options);
      }
    } on SocketException catch (e) {
      patchRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      patchRequestResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: patchRequestResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
        apiRequestResponse: patchRequestResponse);
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      patchRequestWithFormData(
    String endPoint, {
    required FormData formData,
    required bool isRequestAuthorized,
  }) async {
    dynamic patchRequestWithFormDataResponse;
    Options options = Options(
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      patchRequestWithFormDataResponse =
          await dio.patch(endPoint, data: formData, options: options);
    } on SocketException catch (e) {
      patchRequestWithFormDataResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      patchRequestWithFormDataResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: patchRequestWithFormDataResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: patchRequestWithFormDataResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> deleteRequest(
    String endPoint, {
    required bool isRequestAuthorized,
    Map<String, String?>? jsonData,
    bool isDataRequired = false,
  }) async {
    dynamic deleteRequestResponse;
    Options options = Options(
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      if (isDataRequired == true) {
        deleteRequestResponse = await dio.delete(endPoint,
            data: jsonEncode(jsonData), options: options);
      } else {
        deleteRequestResponse = await dio.delete(endPoint, options: options);
      }
    } on SocketException catch (e) {
      deleteRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      deleteRequestResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: deleteRequestResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: deleteRequestResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> getRequest(
    String endPoint, {
    required bool isRequestAuthorized,
    ResponseType? responseType,
  }) async {
    dynamic getRequestResponse;
    Options options = Options(
      responseType: responseType,
      headers: getRequestHeaders(
        isRequestAuthorized: isRequestAuthorized,
      ),
    );
    try {
      getRequestResponse = await dio.get(endPoint, options: options);
    } on SocketException catch (e) {
      getRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on DioException catch (e) {
      getRequestResponse = formatDioExceptionResponse(
        e: e,
        requestResponse: getRequestResponse,
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: getRequestResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      requestResponseBaseOnStatusCode({apiRequestResponse}) async {
    FailureResponse failureResponse;
    if (apiRequestResponse is Map) {
      int statusCode = apiRequestResponse['statusCode'];
      failureResponse = await retrieveFailedResponse.failedResponse(
        statusCode: statusCode,
        response: apiRequestResponse,
      );
      return Left(failureResponse);
    } else {
      int getStatusCode = apiRequestResponse.statusCode;

      switch (getStatusCode) {
        case 200:
        case 201:
          Map<String, dynamic> responseData = {};
          if (apiRequestResponse.data is Uint8List) {
            final pdfData = await apiRequestResponse.data;
            Directory rootPath = await getTemporaryDirectory();
            final file = File('${rootPath.path}/pdf');
            final directory = file.parent;
            if (!await directory.exists()) {
              await directory.create(
                recursive: true,
              );
            }
            await file.writeAsBytes(pdfData);
            responseData = {
              'statusCode': getStatusCode,
              'data': file.path,
            };
          } else {
            responseData = (apiRequestResponse.data is String)
                ? {
                    'statusCode': getStatusCode,
                    'data': apiRequestResponse.data,
                  }
                : apiRequestResponse.data;
          }
          return Right(responseData);
        default:
          GeneralRemoteServerResponse generalRemoteServerResponse =
              GeneralRemoteServerResponse.fromJson(apiRequestResponse);
          debugPrint(
              'this is the state of it ${generalRemoteServerResponse.statusCode}');
          failureResponse = FailureResponse(
            errorMessage: generalRemoteServerResponse.badGateWay
                ? NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest
                : SuccessDataResponse.fromJson(generalRemoteServerResponse.data)
                    .message,
            statusCode: getStatusCode,
            connectivityError: true,
          );
          return Left(failureResponse);
      }
    }
  }

  formatDioExceptionResponse(
      {required DioException e, required requestResponse}) {
    var response = e.response;
    // GeneralFunctions.outputDebugMessage(
    //     'this is the error for api helper ${e.response!.statusMessage} oops $e ${(e.error != null || e.message != null)}');
    if ((e.error != null || e.message != null) && response != null) {
      GeneralFunctions.outputDebugMessage(
          'this is the error for api helper 1 ${e.message}');
      var status = response.statusCode ?? 0;
      var data = response.data;
      GeneralFunctions.outputDebugMessage(response.statusCode.toString());
      GeneralFunctions.outputDebugMessage(data.toString());
      requestResponse = {'statusCode': status, 'data': data};
    } else {
      var status = response != null ? response.statusCode : 0;
      var data = response != null
          ? response.data
          : {'message': 'Network error occured'};
      GeneralFunctions.outputDebugMessage(data.toString());
      requestResponse = formatExceptionResponse(
        data: data,
        statusCode: status!,
      );
    }
    return requestResponse;
  }

  formatExceptionResponse(
      {int statusCode = 0, required Map<String, dynamic> data}) {
    return {'statusCode': statusCode, 'data': data};
  }

  Map<String, String> getRequestHeaders({required bool isRequestAuthorized}) {
    return isRequestAuthorized
        ? {
            APIEndPointsParameter.authHeader: APIEndPointsParameter.authHeader,
            'Accept': 'application/json',
            'Content-Type': 'application/json'
          }
        : {'Accept': 'application/json', 'Content-Type': 'application/json'};
  }
}
