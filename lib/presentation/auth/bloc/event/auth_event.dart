// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class ValidateAccAuthEvent extends AuthEvent {
  String emailAddress;
  ValidateAccAuthEvent({
    required this.emailAddress,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
      ];
}

class LoginAuthEvent extends AuthEvent {
  String emailAddress;
  String password;
  LoginAuthEvent({
    required this.emailAddress,
    required this.password,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
        password,
      ];
}

class CreateAccountAuthEvent extends AuthEvent {
  String firstName;
  String lastName;
  String email;
  String password;
  String confirmPassword;
  bool acceptTerms;

  CreateAccountAuthEvent({
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.acceptTerms,
  }) : super();

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        acceptTerms,
      ];
}

class AcceptTermsAndConditions extends AuthEvent {
  bool accepted;
  AcceptTermsAndConditions({
    required this.accepted,
  }) : super();

  @override
  List<Object?> get props => [
        accepted,
      ];
}

class ValidateGivenPasswordEvent extends AuthEvent {
  String password;
  ValidateGivenPasswordEvent({
    required this.password,
  }) : super();

  @override
  List<Object?> get props => [
        password,
      ];
}

class ValidateEmailAddressForAuth extends AuthEvent {
  String emailAddress;
  ValidateEmailAddressForAuth({
    required this.emailAddress,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
      ];
}

class RequestForForgotPasswordForAuth extends AuthEvent {
  String emailAddress;
  bool resendOTPForPasswordReset;
  RequestForForgotPasswordForAuth({
    required this.emailAddress,
    this.resendOTPForPasswordReset = false,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
        resendOTPForPasswordReset,
      ];
}

class VerifyOTPForForgotPasswordAuth extends AuthEvent {
  String emailAddress;
  String otp;
  VerifyOTPForForgotPasswordAuth({
    required this.emailAddress,
    required this.otp,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
        otp,
      ];
}

class VerifyAccountAuth extends AuthEvent {
  String emailAddress;
  String otp;
  VerifyAccountAuth({
    required this.emailAddress,
    required this.otp,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
        otp,
      ];
}

class VerifyDeviceAuth extends AuthEvent {
  String emailAddress;
  String otp;
  VerifyDeviceAuth({
    required this.emailAddress,
    required this.otp,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
        otp,
      ];
}

class RequestAccountVerificationCodeAuth extends AuthEvent {
  String emailAddress;
  RequestAccountVerificationCodeAuth({
    required this.emailAddress,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
      ];
}

class RequestDeviceVerificationCodeAuth extends AuthEvent {
  String emailAddress;
  RequestDeviceVerificationCodeAuth({
    required this.emailAddress,
  }) : super();

  @override
  List<Object?> get props => [
        emailAddress,
      ];
}

class ConfirmPasswordsForAuth extends AuthEvent {
  String password;
  String confirmPassword;
  ConfirmPasswordsForAuth({
    required this.password,
    required this.confirmPassword,
  }) : super();

  @override
  List<Object?> get props => [
        password,
        confirmPassword,
      ];
}

class ResetPasswordForAuth extends AuthEvent {
  String emailAddress;
  String token;
  String password;
  String confirmPassword;
  ResetPasswordForAuth({
    required this.emailAddress,
    required this.confirmPassword,
    required this.password,
    required this.token,
  }) : super();

  @override
  List<Object?> get props => [emailAddress, confirmPassword, password, token];
}
