import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/entity/response/success/success_response.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/infrastructure/api/httpClientMultipartRequestHandler/http_client_multipart_request_handler.dart';
import 'package:geoattend/infrastructure/api/httpClientURIHelper/http_client_uri_helper.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:injectable/injectable.dart';
import 'package:either_dart/either.dart';

@injectable
class HttpClientApiRequestHelper {
  final InterceptedClient interceptedHttpClient;
  HttpClientApiRequestHelper(
    this.interceptedHttpClient,
  );

  Future<Either<FailureResponse, Map<String, dynamic>>> postRequest(
    String endPoint, {
    Map<String, dynamic>? jsonData,
    bool isDataRequired = false,
    bool isEndPointAuthorized = false,
    String? baseUrl,
  }) async {
    dynamic postRequestResponse;
    try {
      if (isDataRequired == true) {
        postRequestResponse = await interceptedHttpClient.post(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          body: jsonEncode(jsonData),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      } else {
        postRequestResponse = await interceptedHttpClient.post(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      }
    } on SocketException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on HttpException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: postRequestResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> formDataRequest({
    required HttpClientMultipartRequestHandler multipartRequest,
    bool isEndPointAuthorized = false,
  }) async {
    dynamic requestWithFormDataResponse;
    try {
      requestWithFormDataResponse = await interceptedHttpClient.send(
        multipartRequest.getMultipartRequest(
          isRequestAuthorized: isEndPointAuthorized,
        ),
      );
      requestWithFormDataResponse =
          await requestWithFormDataResponse.stream.bytesToString();
    } on SocketException catch (e) {
      requestWithFormDataResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on HttpException catch (e) {
      requestWithFormDataResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: requestWithFormDataResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> putRequest(
    String endPoint, {
    Map<String, dynamic>? jsonData,
    bool isDataRequired = false,
    bool isEndPointAuthorized = false,
    Map<String, dynamic>? headers,
    String? baseUrl,
  }) async {
    dynamic postRequestResponse;
    try {
      if (isDataRequired == true) {
        postRequestResponse = await interceptedHttpClient.put(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          body: jsonEncode(jsonData),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      } else {
        postRequestResponse = await interceptedHttpClient.put(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      }
    } on SocketException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on HttpException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: postRequestResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> patchRequest(
    String endPoint, {
    Map<String, dynamic>? jsonData,
    bool isDataRequired = false,
    bool isEndPointAuthorized = false,
    Map<String, dynamic>? headers,
    String? baseUrl,
  }) async {
    dynamic postRequestResponse;
    try {
      if (isDataRequired == true) {
        postRequestResponse = await interceptedHttpClient.patch(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          body: jsonEncode(jsonData),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      } else {
        postRequestResponse = await interceptedHttpClient.patch(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      }
    } on SocketException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on HttpException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: postRequestResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> getRequest(
    String endPoint, {
    bool isEndPointAuthorized = false,
    String? baseUrl,
  }) async {
    dynamic postRequestResponse;
    try {
      postRequestResponse = await interceptedHttpClient.get(
        HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
        headers: getRequestHeaders(
          isRequestAuthorized: isEndPointAuthorized,
        ),
      );
    } on SocketException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on HttpException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: postRequestResponse,
    );
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> deleteRequest(
    String endPoint, {
    Map<String, dynamic>? jsonData,
    bool isDataRequired = false,
    bool isEndPointAuthorized = false,
    String? baseUrl,
  }) async {
    dynamic postRequestResponse;
    try {
      if (isDataRequired == true) {
        postRequestResponse = await interceptedHttpClient.delete(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          body: jsonEncode(jsonData),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      } else {
        postRequestResponse = await interceptedHttpClient.delete(
          HttpClientUriHelper.getUri(baseURL: baseUrl, path: endPoint),
          headers: getRequestHeaders(
            isRequestAuthorized: isEndPointAuthorized,
          ),
        );
      }
    } on SocketException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    } on HttpException catch (e) {
      postRequestResponse = formatExceptionResponse(
        data: {
          'message': e.message,
        },
      );
    }
    return requestResponseBaseOnStatusCode(
      apiRequestResponse: postRequestResponse,
    );
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

  Future<Either<FailureResponse, Map<String, dynamic>>>
      requestResponseBaseOnStatusCode({apiRequestResponse}) async {
    Map<String, dynamic> data = {};
    if (apiRequestResponse is String) {
      data = jsonDecode(apiRequestResponse);
    } else {
      data = jsonDecode(apiRequestResponse.body);
    }
    debugPrint('this is the status of request data $data');
    SuccessResponse response = SuccessResponse.fromJson(data);
    FailureResponse failureResponse;
    dynamic getStatusCode = response.status;

    if (getStatusCode is bool) {
      Map<String, dynamic> responseData = data;
      return Right(responseData);
    } else {
      switch (getStatusCode) {
        case 200:
        case 201:
          Map<String, dynamic> responseData = data;
          return Right(responseData);
        default:
          failureResponse = FailureResponse(
            errorMessage: response.message,
            statusCode: getStatusCode,
          );
          return Left(failureResponse);
      }
    }
  }

  formatExceptionResponse(
      {int statusCode = 0, required Map<String, dynamic> data}) {
    return {'statusCode': statusCode, 'data': data};
  }
}
