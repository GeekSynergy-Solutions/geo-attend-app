// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/errorFieldData/authFieldValidation/auth_field_validation.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class InitAuthState extends AuthState {
  const InitAuthState() : super();

  @override
  List<Object?> get props => [];
}

class LoadingAuthState extends AuthState {
  const LoadingAuthState() : super();

  @override
  List<Object?> get props => [];
}

class ValidationAuthState extends AuthState {
  AuthFieldValidation? authFieldValidation;
  ValidationAuthState({
    this.authFieldValidation,
  }) : super();

  @override
  List<Object?> get props => [
        authFieldValidation,
      ];
}

class FailureAuthState extends AuthState {
  bool isUnAuthorized;
  String errorMessage;
  bool isRequestSuccessful;
  bool? isAccountUserVerified;
  bool? isDeviceUserVerified;
  AuthFieldValidation authFieldValidation;
  FailureAuthState({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.createAccount({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.login({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    required this.isDeviceUserVerified,
    required this.isAccountUserVerified,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.validateAcc({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.requestForgotPassword({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.verifyForgotPasswordOtp({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.verifyAccount({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.verifyDevice({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.resendAccVerificationCode({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.resendDeviceVerificationCode({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();
  FailureAuthState.resetPassword({
    required this.isUnAuthorized,
    required this.errorMessage,
    required this.authFieldValidation,
    this.isRequestSuccessful = false,
  }) : super();

  @override
  List<Object?> get props => [
        isUnAuthorized,
        errorMessage,
        isRequestSuccessful,
        authFieldValidation,
      ];
}

class SuccessAuthState extends AuthState {
  String successMessage;
  String? emailAddress;
  String? token;
  bool isRequestSuccessful;
  bool? resendAccVerificationCode;
  bool? resendDeviceVerificationCode;
  SuccessfulUserDataStatus? successfulUserDataStatus;
  SuccessAuthState({
    required this.successMessage,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.createAccount({
    required this.successMessage,
    required this.emailAddress,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.login({
    required this.successMessage,
    required this.successfulUserDataStatus,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.validateAcc({
    required this.successMessage,
    required this.emailAddress,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.requestForgotPassword({
    required this.successMessage,
    required this.emailAddress,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.verifyForgotPasswordOtp({
    required this.successMessage,
    required this.emailAddress,
    this.token,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.verifyAccount({
    required this.successMessage,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.verifyDevice({
    required this.successMessage,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.resendDeviceVerificationCode({
    required this.successMessage,
    required this.emailAddress,
    this.resendAccVerificationCode = true,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.resendAccVerificationCode({
    required this.successMessage,
    required this.emailAddress,
    this.resendDeviceVerificationCode = true,
    this.isRequestSuccessful = true,
  }) : super();
  SuccessAuthState.resetPassword({
    required this.successMessage,
    this.isRequestSuccessful = true,
  }) : super();

  @override
  List<Object?> get props => [
        successMessage,
        emailAddress,
        isRequestSuccessful,
        resendAccVerificationCode,
        resendDeviceVerificationCode,
        successfulUserDataStatus,
      ];
}
