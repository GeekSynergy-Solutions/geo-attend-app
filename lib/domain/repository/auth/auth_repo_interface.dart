import 'package:either_dart/either.dart';
import 'package:geoattend/data/remote/auth/model/verifiedUserData/verified_user_data_model.dart';
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
import 'package:geoattend/domain/entity/response/success/success_response.dart';

abstract class AuthRepoInterface {
  Future<Either<FailureResponse, SuccessResponse>> validateAccountAuthRepoRequest(
      {required ValidateAccountRequest request});
  Future<Either<FailureResponse, VerifiedUserDataModel>> loginAuthRepoRequest(
      {required LoginRequest request});
  Future<Either<FailureResponse, VerifiedUserDataModel>> continueAsAGuestUserAuthRepoRequest(
      {required ContinueAsAGuestRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      verifyAccountAuthRepoRequest({required VerifyAccountRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      verifyDeviceAuthRepoRequest({required VerifyDeviceRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      resendAccountVerificationAuthRepoRequest({required ResendAccVerificationRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      resendDeviceVerificationAuthRepoRequest({required ResendDeviceVerificationRequest request});
  Future<Either<FailureResponse, SuccessResponse>> createAccountAuthRepoRequest(
      {required CreateAccountRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      requestForgotPasswordAuthRepoRequest(
          {required RequestForgotPasswordRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      resendForgotPasswordAuthRepoRequest(
          {required RequestForgotPasswordRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      verifyForgotPasswordOtpAuthRepoRequest(
          {required VerifyForgotPasswordOtpRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      resetForgotPasswordAuthRepoRequest(
          {required ResetPasswordRequest request});
  Future<Either<FailureResponse, SuccessResponse>>
      logoutAuthRepoRequest();
  Future<Either<FailureResponse, SuccessResponse>>
      refreshTokenAuthRepoRequest();
}
