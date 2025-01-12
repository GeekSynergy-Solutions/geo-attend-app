import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/data/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:geoattend/data/localStorage/remoteDataUpdateInLocalDb/remote_data_update_in_local_db.dart';
import 'package:geoattend/data/localStorage/requestLocalDb/request_user_data.dart';
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:geoattend/data/remote/auth/model/verifiedUserData/verified_user_data_model.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocation/here_location_model.dart';
import 'package:geoattend/domain/entity/errorFieldData/authFieldValidation/auth_field_validation.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/locationPositionData/location_position_data.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/domain/entity/request/auth/createAccount/create_account_request.dart';
import 'package:geoattend/domain/entity/request/auth/login/login_request.dart';
import 'package:geoattend/domain/entity/request/auth/requestForgotPassword/request_forgot_password_request.dart';
import 'package:geoattend/domain/entity/request/auth/resendAccVerification/resend_acc_verification_request.dart';
import 'package:geoattend/domain/entity/request/auth/resendDeviceVerification/resend_device_verification_request.dart';
import 'package:geoattend/domain/entity/request/auth/resetPassword/reset_password_request.dart';
import 'package:geoattend/domain/entity/request/auth/verifyAccount/verify_account_request.dart';
import 'package:geoattend/domain/entity/request/auth/verifyDevice/verify_device_request.dart';
import 'package:geoattend/domain/entity/request/auth/verifyForgotPasswordOtp/verify_forgot_password_otp_request.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/entity/response/success/success_response.dart';
import 'package:geoattend/domain/repository/auth/auth_repo_interface.dart';
import 'package:geoattend/infrastructure/util/deviceData/device_data.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/stringVaildator/string_vaildator.dart';
import 'package:geoattend/presentation/auth/bloc/event/auth_event.dart';
import 'package:geoattend/presentation/auth/bloc/state/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppSharedPreferences appSharedPreferences;
  final AppFlutterSecureStorage secureStorage;
  final AuthRepoInterface authRepoInterface;
  final RequestUserData requestUserData;

  AuthFieldValidation authFieldValidation = AuthFieldValidation();

  HereLocationModel? hereLocation;
  HereLocationModel? herePosition;

  LocationPositionData locationPositionData = LocationPositionData();

  AttendanceData? updateAttendanceData;

  AuthBloc(
    this.appSharedPreferences,
    this.secureStorage,
    this.authRepoInterface,
    this.requestUserData,
  ) : super(const InitAuthState()) {
    on<ValidateAccAuthEvent>((event, emit) {});
    on<LoginAuthEvent>((event, emit) async {
      String emailAddress = event.emailAddress;
      String password = event.password;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid:
            StringVaildator.emailAddressValidator(emailAddress: emailAddress),
        isPasswordValid: !GeneralFunctions.checkFieldIfStringIsEmpty(password),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isPasswordValid &&
              authFieldValidation.isEmailAddressValid;

      if (authFieldValidation.fieldValidationStatus) {
        String deviceName = await DeviceData.modelName();
        String deviceId = await DeviceData.deviceId();

        Either<FailureResponse, SuccessResponse> loginRequestResponse =
            await authRepoInterface.loginAuthRepoRequest(
          request: LoginRequest(
            email: emailAddress,
            password: password,
            deviceName: deviceName,
            deviceId: deviceId,
          ),
        );
        if (loginRequestResponse.isRight) {
          VerifiedUserDataModel verifiedUserData = VerifiedUserDataModel.fromJson(loginRequestResponse.right.data) ;
          await RemoteDataUpdateInLocalDb.addUpdateUser(
            requestUserData: requestUserData,
            verifiedUser: verifiedUserData,
          );

          await appSharedPreferences.cacheUserEmail(emailAddress: emailAddress);
          await appSharedPreferences.cacheUserTokenExpiryDate(verifiedUserData.tokenExpiryDate!);
          await secureStorage.setLoginToken(verifiedUserData.token);
          await secureStorage.setRefreshToken(verifiedUserData.refreshToken);
          await secureStorage.setUserAuthEmail(verifiedUserData.email);
          await secureStorage.setUserAuthPassword(password);

          emit(
            SuccessAuthState.login(
              successMessage: verifiedUserData.accountVerified
                  ? verifiedUserData.deviceVerified
                      ? 'Successful'
                      : 'Account verification needed'
                  : 'Device verification needed',
              successfulUserDataStatus: SuccessfulUserDataStatus.verifiedUser(
                verifiedUserDataResponse: verifiedUserData,
              ),
            ),
          );
        } else {
          FailureResponse loginFailedRequestResponse =
              loginRequestResponse.left;
          emit(
            FailureAuthState.login(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: loginFailedRequestResponse.statusCode),
              errorMessage: loginFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
              isAccountUserVerified: false,
              isDeviceUserVerified: false,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<CreateAccountAuthEvent>((event, emit) async {
      String emailAddress = event.email;
      String password = event.password;
      String confirmPassword = event.confirmPassword;
      String firstName = event.firstName;
      String lastName = event.lastName;
      bool acceptTerms = event.acceptTerms;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid:
            StringVaildator.emailAddressValidator(emailAddress: emailAddress),
        isPasswordValid: StringVaildator.passwordValidator(
          password: event.password,
        ),
        isConfirmPasswordValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(confirmPassword),
        isFirstNameValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(firstName),
        isLastNameValid: !GeneralFunctions.checkFieldIfStringIsEmpty(lastName),
        isPasswordMismatched: !StringVaildator.doesPasswordMatch(
            password: password, confirmPassword: confirmPassword),
        isTermsOfServiceAgreed: acceptTerms,
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isPasswordValid &&
              authFieldValidation.isConfirmPasswordValid &&
              authFieldValidation.isFirstNameValid &&
              authFieldValidation.isLastNameValid &&
              !authFieldValidation.isPasswordMismatched &&
              authFieldValidation.isTermsOfServiceAgreed &&
              authFieldValidation.isEmailAddressValid;

      if (authFieldValidation.fieldValidationStatus) {
        String deviceName = await DeviceData.modelName();
        String deviceId = await DeviceData.deviceId();

        Either<FailureResponse, SuccessResponse> createAccountRequestResponse =
            await authRepoInterface.createAccountAuthRepoRequest(
          request: CreateAccountRequest(
            email: emailAddress,
            password: password,
            deviceName: deviceName,
            deviceId: deviceId,
            acceptTerms: acceptTerms,
            confirmPassword: confirmPassword,
            firstName: firstName,
            lastName: lastName,
          ),
        );
        if (createAccountRequestResponse.isRight) {
          SuccessResponse successResponse = createAccountRequestResponse.right;
          emit(
            SuccessAuthState.createAccount(
              successMessage: successResponse.message,
              emailAddress: emailAddress,
            ),
          );
        } else {
          FailureResponse createAccountFailedRequestResponse =
              createAccountRequestResponse.left;
          emit(
            FailureAuthState.createAccount(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: createAccountFailedRequestResponse.statusCode),
              errorMessage: createAccountFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<AcceptTermsAndConditions>((event, emit) {
      emit(ValidationAuthState());
      authFieldValidation = AuthFieldValidation(
        isTermsOfServiceAgreed: event.accepted,
      );
      emit(ValidationAuthState(
        authFieldValidation: authFieldValidation,
      ));
    });
    on<ValidateGivenPasswordEvent>((event, emit) {
      emit(ValidationAuthState());
      authFieldValidation = AuthFieldValidation(
        isPasswordValid: StringVaildator.passwordValidator(
          password: event.password,
        ),
      );
      emit(ValidationAuthState(
        authFieldValidation: authFieldValidation,
      ));
    });
    on<ValidateEmailAddressForAuth>((event, emit) {
      emit(ValidationAuthState());
      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(event.emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: event.emailAddress,
        ),
      );
      emit(ValidationAuthState(
        authFieldValidation: authFieldValidation,
      ));
    });
    on<RequestForForgotPasswordForAuth>((event, emit) async {
      String emailAddress = event.emailAddress;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: emailAddress,
        ),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isEmailAddressValid;

      if (authFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, SuccessResponse>
            requestForgotPasswordRequestResponse =
            await authRepoInterface.requestForgotPasswordAuthRepoRequest(
          request: RequestForgotPasswordRequest(
            email: emailAddress,
          ),
        );
        if (requestForgotPasswordRequestResponse.isRight) {
          SuccessResponse successResponse =
              requestForgotPasswordRequestResponse.right;
          emit(
            SuccessAuthState.requestForgotPassword(
              successMessage: successResponse.message,
              emailAddress: emailAddress,
            ),
          );
        } else {
          FailureResponse requestFailedRequestResponse =
              requestForgotPasswordRequestResponse.left;
          emit(
            FailureAuthState.requestForgotPassword(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: requestFailedRequestResponse.statusCode),
              errorMessage: requestFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<VerifyOTPForForgotPasswordAuth>((event, emit) async {
      String emailAddress = event.emailAddress;
      String otp = event.otp;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: emailAddress,
        ),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isEmailAddressValid &&
              !GeneralFunctions.checkFieldIfStringIsEmpty(otp);

      if (authFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, SuccessResponse>
            verifyForgotPasswordRequestResponse =
            await authRepoInterface.verifyForgotPasswordOtpAuthRepoRequest(
          request: VerifyForgotPasswordOtpRequest(
            email: emailAddress,
            otp: otp,
          ),
        );
        if (verifyForgotPasswordRequestResponse.isRight) {
          SuccessResponse successResponse =
              verifyForgotPasswordRequestResponse.right;
          emit(
            SuccessAuthState.verifyForgotPasswordOtp(
              successMessage: successResponse.message,
              emailAddress: emailAddress,
            ),
          );
        } else {
          FailureResponse verifyOtpFailedRequestResponse =
              verifyForgotPasswordRequestResponse.left;
          emit(
            FailureAuthState.verifyForgotPasswordOtp(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: verifyOtpFailedRequestResponse.statusCode),
              errorMessage: verifyOtpFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<VerifyAccountAuth>((event, emit) async {
      String emailAddress = event.emailAddress;
      String otp = event.otp;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: emailAddress,
        ),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isEmailAddressValid &&
              !GeneralFunctions.checkFieldIfStringIsEmpty(otp);

      if (authFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, SuccessResponse> verifyAccountRequestResponse =
            await authRepoInterface.verifyAccountAuthRepoRequest(
          request: VerifyAccountRequest(
            email: emailAddress,
            otp: otp,
          ),
        );
        if (verifyAccountRequestResponse.isRight) {
          SuccessResponse successResponse = verifyAccountRequestResponse.right;
          emit(
            SuccessAuthState.verifyAccount(
              successMessage: successResponse.message,
            ),
          );
        } else {
          FailureResponse verifyAccountFailedRequestResponse =
              verifyAccountRequestResponse.left;
          emit(
            FailureAuthState.verifyAccount(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: verifyAccountFailedRequestResponse.statusCode),
              errorMessage: verifyAccountFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<VerifyDeviceAuth>((event, emit) async {
      String emailAddress = event.emailAddress;
      String otp = event.otp;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: emailAddress,
        ),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isEmailAddressValid &&
              !GeneralFunctions.checkFieldIfStringIsEmpty(otp);

      if (authFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, SuccessResponse> verifyDeviceRequestResponse =
            await authRepoInterface.verifyDeviceAuthRepoRequest(
          request: VerifyDeviceRequest(
            email: emailAddress,
            otp: otp,
          ),
        );
        if (verifyDeviceRequestResponse.isRight) {
          SuccessResponse successResponse = verifyDeviceRequestResponse.right;
          emit(
            SuccessAuthState.verifyDevice(
              successMessage: successResponse.message,
            ),
          );
        } else {
          FailureResponse verifyDeviceFailedRequestResponse =
              verifyDeviceRequestResponse.left;
          emit(
            FailureAuthState.verifyDevice(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: verifyDeviceFailedRequestResponse.statusCode),
              errorMessage: verifyDeviceFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<RequestAccountVerificationCodeAuth>((event, emit) async {
      String emailAddress = event.emailAddress;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: emailAddress,
        ),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isEmailAddressValid;

      if (authFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, SuccessResponse>
            resendAccVerificationCodeRequestResponse =
            await authRepoInterface.resendAccountVerificationAuthRepoRequest(
          request: ResendAccVerificationRequest(
            email: emailAddress,
          ),
        );
        if (resendAccVerificationCodeRequestResponse.isRight) {
          SuccessResponse successResponse =
              resendAccVerificationCodeRequestResponse.right;
          emit(
            SuccessAuthState.resendAccVerificationCode(
              successMessage: successResponse.message,
              emailAddress: emailAddress,
            ),
          );
        } else {
          FailureResponse resendVerificationFailedRequestResponse =
              resendAccVerificationCodeRequestResponse.left;
          emit(
            FailureAuthState.resendAccVerificationCode(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode:
                      resendVerificationFailedRequestResponse.statusCode),
              errorMessage:
                  resendVerificationFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<RequestDeviceVerificationCodeAuth>((event, emit) async {
      String emailAddress = event.emailAddress;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: emailAddress,
        ),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isEmailAddressValid;

      if (authFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, SuccessResponse>
            resendDeviceVerificationCodeRequestResponse =
            await authRepoInterface.resendDeviceVerificationAuthRepoRequest(
          request: ResendDeviceVerificationRequest(
            email: emailAddress,
          ),
        );
        if (resendDeviceVerificationCodeRequestResponse.isRight) {
          SuccessResponse successResponse =
              resendDeviceVerificationCodeRequestResponse.right;
          emit(
            SuccessAuthState.resendDeviceVerificationCode(
              successMessage: successResponse.message,
              emailAddress: emailAddress,
            ),
          );
        } else {
          FailureResponse resendVerificationFailedRequestResponse =
              resendDeviceVerificationCodeRequestResponse.left;
          emit(
            FailureAuthState.resendDeviceVerificationCode(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode:
                      resendVerificationFailedRequestResponse.statusCode),
              errorMessage:
                  resendVerificationFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
    on<ConfirmPasswordsForAuth>((event, emit) {
      emit(ValidationAuthState());
      authFieldValidation = AuthFieldValidation(
        isConfirmPasswordValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(event.confirmPassword),
        isPasswordMismatched: !StringVaildator.doesPasswordMatch(
          confirmPassword: event.confirmPassword,
          password: event.password,
        ),
      );
      emit(ValidationAuthState(
        authFieldValidation: authFieldValidation,
      ));
    });
    on<ResetPasswordForAuth>((event, emit) async {
      String emailAddress = event.emailAddress;
      String confirmPassword = event.confirmPassword;
      String password = event.password;

      emit(
        const LoadingAuthState(),
      );

      authFieldValidation = AuthFieldValidation(
        isEmailAddressEmpty:
            GeneralFunctions.checkFieldIfStringIsEmpty(emailAddress),
        isEmailAddressValid: StringVaildator.emailAddressValidator(
          emailAddress: emailAddress,
        ),
        isConfirmPasswordValid:
            GeneralFunctions.checkFieldIfStringIsEmpty(confirmPassword),
        isPasswordMismatched: !StringVaildator.doesPasswordMatch(
            password: password, confirmPassword: confirmPassword),
        isPasswordValid: StringVaildator.passwordValidator(password: password),
      );

      authFieldValidation.fieldValidationStatus =
          !authFieldValidation.isEmailAddressEmpty &&
              authFieldValidation.isPasswordValid &&
              authFieldValidation.isConfirmPasswordValid &&
              !authFieldValidation.isPasswordMismatched &&
              authFieldValidation.isEmailAddressValid;

      if (authFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, SuccessResponse> resetPasswordRequestResponse =
            await authRepoInterface.resetForgotPasswordAuthRepoRequest(
          request: ResetPasswordRequest(
            email: emailAddress,
            confirmPassword: confirmPassword,
            password: password,
          ),
        );
        if (resetPasswordRequestResponse.isRight) {
          SuccessResponse successResponse = resetPasswordRequestResponse.right;
          emit(
            SuccessAuthState.resetPassword(
              successMessage: successResponse.message,
            ),
          );
        } else {
          FailureResponse resetFailedRequestResponse =
              resetPasswordRequestResponse.left;
          emit(
            FailureAuthState.resetPassword(
              isUnAuthorized: GeneralFunctions.checkIfRequestIsUnauthorized(
                  statusCode: resetFailedRequestResponse.statusCode),
              errorMessage: resetFailedRequestResponse.errorMessage,
              authFieldValidation: authFieldValidation,
            ),
          );
        }
      } else {
        emit(
          FailureAuthState(
            isUnAuthorized: false,
            errorMessage: GeneralConstantValues.requiredFieldMessage,
            authFieldValidation: authFieldValidation,
          ),
        );
      }
    });
  }
}
