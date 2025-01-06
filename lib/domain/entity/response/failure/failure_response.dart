import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:geoattend/domain/entity/response/error/error_response.dart';
import 'package:geoattend/domain/entity/response/error/remoteError/remote_error_response.dart';
import 'package:geoattend/domain/entity/response/generalRemoteServerResponse/general_remote_server_response.dart';
import 'package:geoattend/domain/entity/response/success/success_response.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/networkRequestMsgErrorStatusCodeConstantValueClass/network_request_error_msg_status_code_constant_value_class.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

FailureResponse internetErrorResponse = FailureResponse(
    errorMessage: 'Check your internet connection', statusCode: 0);

FailureResponse errorOccuredResponse =
    FailureResponse(errorMessage: 'An error Occured, try again', statusCode: 1);

FailureResponse networkErrorResponse =
    FailureResponse(errorMessage: 'Network error, try again', statusCode: 2);

// ignore: must_be_immutable
class FailureResponse extends Equatable {
  int statusCode;
  String errorMessage;
  dynamic data;
  bool connectivityError;
  FailureResponse({
    required this.errorMessage,
    required this.statusCode,
    this.connectivityError = false,
    this.data,
  });
  @override
  List<Object?> get props => [
        statusCode,
        errorMessage,
        data,
        connectivityError,
      ];
}

@injectable
class RetrieveFailedResponseClass {
  final AppSharedPreferences appSharedPreferences;
  RetrieveFailedResponseClass(this.appSharedPreferences);
  Future<FailureResponse> failedResponse(
      {required int statusCode, required response}) async {
    FailureResponse failureResponse;
    GeneralRemoteServerResponse generalRemoteServerResponse =
        GeneralRemoteServerResponse.fromJson(response);
    dynamic data = generalRemoteServerResponse.data;
    String? error;
    if (data is Map<String, dynamic>) {
      // String errorMessage =
      //     ErrorResponse.fromJson(SuccessResponse.fromJson(data).errors)
      //         .message!;
      error = ErrorResponse.fromJson(data).message;
    }

    if (error != null && error.isNotEmpty) {
      error = GeneralFunctions.convertFirstCharToUpperCaseChar(
        value: error,
      );
    }
    switch (statusCode) {
      case 500:
        failureResponse = FailureResponse(
          errorMessage: error ??
              NetworkRequestErrorMsgStatusCodeConstantValueClass.internalError,
          statusCode: statusCode,
        );
        break;
      case 404:
        failureResponse = FailureResponse(
          errorMessage: error ??
              NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          statusCode: statusCode,
        );
        break;
      case 403:
        failureResponse = FailureResponse(
          errorMessage: error ??
              NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          statusCode: statusCode,
          data: data != null
              ? (data is Map<String, dynamic>)
                  ? data['data'] ?? {}
                  : []
              : {},
        );
        break;
      case 401:
        failureResponse = FailureResponse(
          data: data != null
              ? (data is Map<String, dynamic>)
                  ? data['data'] ?? {}
                  : []
              : {},
          errorMessage: error ??
              errorMessageHandlingFromDB(
                response: response,
                isItFromBadRequest: true,
              ),
          statusCode: statusCode,
        );
        break;
      case 400:
        failureResponse = FailureResponse(
          data: data != null
              ? (data is Map<String, dynamic>)
                  ? data['data'] ?? {}
                  : []
              : {},
          errorMessage: error ??
              errorMessageHandlingFromDB(
                response: response,
                isItFromBadRequest: true,
              ),
          statusCode: statusCode,
        );
        break;
      default:
        failureResponse = FailureResponse(
          errorMessage: errorMessageHandlingFromDB(
            response: response,
            isItFromBadRequest: false,
          ),
          statusCode: statusCode,
          connectivityError: true,
        );
        break;
    }
    return failureResponse;
  }

  Future<FailureResponse> mapFailedResponse({
    required int statusCode,
  }) async {
    FailureResponse failureResponse;
    switch (statusCode) {
      case 500:
        failureResponse = FailureResponse(
          errorMessage:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.internalError,
          statusCode: statusCode,
        );
        break;
      case 404:
        failureResponse = FailureResponse(
          errorMessage:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.notFound,
          statusCode: statusCode,
        );
        break;
      case 401:
        failureResponse = FailureResponse(
          errorMessage:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.unauthorized,
          statusCode: statusCode,
        );
        break;
      case 400:
        failureResponse = FailureResponse(
          errorMessage:
              NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest,
          statusCode: statusCode,
        );
        break;
      default:
        failureResponse = FailureResponse(
          errorMessage: 'An error occured, try again',
          statusCode: statusCode,
          connectivityError: true,
        );
        break;
    }
    return failureResponse;
  }

  String errorMessageHandlingFromDB(
      {required response, required bool isItFromBadRequest}) {
    GeneralRemoteServerResponse responseData =
        GeneralRemoteServerResponse.fromJson(response);
    String message = '';
    if (!responseData.requestMethodNotAllowed) {
      if (responseData.data is Map<String, dynamic>) {
        dynamic data = SuccessResponse.fromJson(
          responseData.data,
        ).data;
        if (responseData.isThereAVaildationError &&
            data is Map<String, dynamic>) {
          dynamic errors = RemoteErrorResponse.fromJson(data).errors;
          if (errors is Map<String, dynamic>) {
            message = isItFromBadRequest
                ? ErrorResponse.fromJson(errors).message ??
                    NetworkRequestErrorMsgStatusCodeConstantValueClass
                        .badRequest
                : NetworkRequestErrorMsgStatusCodeConstantValueClass.badRequest;
          } else {
            message = SuccessResponse.fromJson(responseData.data)
                        .title!
                        .isNotEmpty &&
                    SuccessResponse.fromJson(responseData.data).message.isEmpty
                ? SuccessResponse.fromJson(responseData.data).title!
                : SuccessResponse.fromJson(responseData.data).message;
          }
        } else {
          message = (responseData.isThereAVaildationError)
              ? (SuccessResponse.fromJson(responseData.data).errors
                      is Map<String, dynamic>)
                  ? ErrorResponse.fromJson(
                      SuccessResponse.fromJson(responseData.data).errors,
                    ).message!
                  : SuccessResponse.fromJson(responseData.data)
                              .title!
                              .isNotEmpty &&
                          SuccessResponse.fromJson(responseData.data)
                              .message
                              .isEmpty
                      ? SuccessResponse.fromJson(responseData.data).title!
                      : SuccessResponse.fromJson(responseData.data).message
              : 'Error occurred, please try again';
        }
      } else {
        if (responseData.data is String) {
          message = responseData.data;
        }
      }
    } else {
      message = 'Error occurred, contact support';
    }
    return message;
  }
}
