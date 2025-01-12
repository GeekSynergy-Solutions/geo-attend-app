import 'package:either_dart/either.dart';
import 'package:geoattend/data/remote/auth/dataProvider/auth_data.dart';
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
import 'package:geoattend/domain/repository/auth/auth_repo_interface.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoInterface)
class AuthRepo implements AuthRepoInterface {
  final AuthData authData;

  AuthRepo(
    this.authData,
  );

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      logoutAuthRepoRequest() async {
    var responseData = await authData.logoutAuthRequest();
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      refreshTokenAuthRepoRequest() async {
    var responseData = await authData.refreshTokenAuthRequest();
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      validateAccountAuthRepoRequest(
          {required ValidateAccountRequest request}) async {
    var responseData = await authData.validateAccAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>> loginAuthRepoRequest(
      {required LoginRequest request}) async {
    var responseData = await authData.loginAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      requestForgotPasswordAuthRepoRequest(
          {required RequestForgotPasswordRequest request}) async {
    var responseData = await authData.forgotPasswordAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      resendForgotPasswordAuthRepoRequest(
          {required RequestForgotPasswordRequest request}) async {
    var responseData = await authData.resendForgotPasswordAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      resetForgotPasswordAuthRepoRequest(
          {required ResetPasswordRequest request}) async {
    var responseData = await authData.resetPasswordAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      verifyForgotPasswordOtpAuthRepoRequest(
          {required VerifyForgotPasswordOtpRequest request}) async {
    var responseData = await authData.verifyOTPAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      continueAsAGuestUserAuthRepoRequest(
          {required ContinueAsAGuestRequest request}) async {
    var responseData = await authData.continueAsAGuestUserAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>>
      resendAccountVerificationAuthRepoRequest(
          {required ResendAccVerificationRequest request}) async {
    var responseData = await authData.resendAccVerificationAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>> verifyAccountAuthRepoRequest(
      {required VerifyAccountRequest request}) async {
    var responseData = await authData.verifyAccountAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>> createAccountAuthRepoRequest({required CreateAccountRequest request}) async{
    var responseData = await authData.createAccountAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>> resendDeviceVerificationAuthRepoRequest({required ResendDeviceVerificationRequest request}) async{
    var responseData = await authData.resendDeviceVerificationAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }

  @override
  Future<Either<FailureResponse, SuccessResponse>> verifyDeviceAuthRepoRequest({required VerifyDeviceRequest request}) async{
    var responseData = await authData.verifyDeviceAuthRequest(
      request: request,
    );
    if (responseData.isRight) {
      return Right(SuccessResponse.fromJson(responseData.right));
    } else {
      return Left(responseData.left);
    }
  }
}
