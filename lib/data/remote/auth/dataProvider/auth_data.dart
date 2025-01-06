import 'package:geoattend/domain/entity/request/auth/login/login_request.dart';
import 'package:geoattend/domain/entity/request/auth/requestForgotPassword/request_forgot_password_request.dart';
import 'package:geoattend/domain/entity/request/auth/resendAccVerification/resend_acc_verification_request.dart';
import 'package:geoattend/domain/entity/request/auth/resendDeviceVerification/resend_device_verification_request.dart';
import 'package:geoattend/domain/entity/request/auth/resetPassword/reset_password_request.dart';
import 'package:geoattend/domain/entity/request/auth/createAccount/create_account_request.dart';
import 'package:geoattend/domain/entity/request/auth/continueAsAGuest/continue_as_a_guest_request.dart';
import 'package:geoattend/domain/entity/request/auth/validateAccount/validate_account_request.dart';
import 'package:geoattend/domain/entity/request/auth/verifyAccount/verify_account_request.dart';
import 'package:geoattend/domain/entity/request/auth/verifyDevice/verify_device_request.dart';
import 'package:geoattend/domain/entity/request/auth/verifyForgotPasswordOtp/verify_forgot_password_otp_request.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/infrastructure/api/apiRequestHelper/api_request_helper.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthData {
  ApiRequestHelper apiRequestHelper;
  AuthData(
    this.apiRequestHelper,
  );

  Future<Either<FailureResponse, Map<String, dynamic>>> createAccountAuthRequest(
      {required CreateAccountRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> createAccountAuthRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.signUpEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return createAccountAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> loginAuthRequest(
      {required LoginRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> loginAuthRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.logInEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return loginAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> validateAccAuthRequest(
      {required ValidateAccountRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        validateAccAuthRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.validateAccEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return validateAccAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> continueAsAGuestUserAuthRequest(
      {required ContinueAsAGuestRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        tagGuestUserAuthRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.continueAsAGuestEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return tagGuestUserAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      logoutAuthRequest() async {
    Either<FailureResponse, Map<String, dynamic>> logoutAuthRequestResponse =
        await apiRequestHelper.getRequest(
      APIEndPoints.logOutEndPoint,
      isRequestAuthorized: true,
    );
    return logoutAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      refreshTokenAuthRequest() async {
    Either<FailureResponse, Map<String, dynamic>>
        refreshTokenAuthRequestResponse = await apiRequestHelper.getRequest(
      APIEndPoints.refreshTokenEndPoint,
      isRequestAuthorized: true,
    );
    return refreshTokenAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      forgotPasswordAuthRequest(
          {required RequestForgotPasswordRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        forgotPasswordAuthRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.requestForgotPasswordEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return forgotPasswordAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      resendForgotPasswordAuthRequest(
          {required RequestForgotPasswordRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        forgotPasswordAuthRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.resendForgotPasswordReqEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return forgotPasswordAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>>
      resetPasswordAuthRequest({required ResetPasswordRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>>
        resetPasswordAuthRequestResponse = await apiRequestHelper.postRequest(
      APIEndPoints.resetPasswordEndPoint,
      isDataRequired: true,
      isRequestAuthorized: true,
      jsonData: request.toJson(),
    );
    return resetPasswordAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> verifyOTPAuthRequest(
      {required VerifyForgotPasswordOtpRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> verifyOtpAuthRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.verifyForgotPasswordRequestOtpEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return verifyOtpAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> verifyAccountAuthRequest(
      {required VerifyAccountRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> verifyAccAuthRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.verifyAccountEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return verifyAccAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> verifyDeviceAuthRequest(
      {required VerifyDeviceRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> verifyDeviceAuthRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.verifyDeviceEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return verifyDeviceAuthRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> resendAccVerificationAuthRequest(
      {required ResendAccVerificationRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> resendAccVerificationRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.resendAccVerificationEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return resendAccVerificationRequestResponse;
  }

  Future<Either<FailureResponse, Map<String, dynamic>>> resendDeviceVerificationAuthRequest(
      {required ResendDeviceVerificationRequest request}) async {
    Either<FailureResponse, Map<String, dynamic>> resendDeviceVerificationRequestResponse =
        await apiRequestHelper.postRequest(
      APIEndPoints.resendDeviceVerificationEndPoint,
      isDataRequired: true,
      isRequestAuthorized: false,
      jsonData: request.toJson(),
    );
    return resendDeviceVerificationRequestResponse;
  }
}
