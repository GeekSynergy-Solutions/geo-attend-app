// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AuthFieldValidation extends Equatable {
  bool isEmailAddressEmpty;
  bool isEmailAddressValid;
  bool isPasswordValid;
  bool isPasswordMismatched;
  bool isFirstNameValid;
  bool isLastNameValid;
  bool isConfirmPasswordValid;
  bool isTermsOfServiceAgreed;
  bool isOtpValueValid;
  bool fieldValidationStatus;

  AuthFieldValidation({
    this.isEmailAddressEmpty = false,
    this.isEmailAddressValid = false,
    this.isPasswordValid = false,
    this.isPasswordMismatched = false,
    this.isFirstNameValid = false,
    this.isLastNameValid = false,
    this.isConfirmPasswordValid = false,
    this.isTermsOfServiceAgreed = false,
    this.isOtpValueValid = false,
    this.fieldValidationStatus = false,
  });

  @override
  List<Object?> get props => [
        isEmailAddressEmpty,
        isEmailAddressValid,
        isPasswordValid,
        isPasswordMismatched,
        isFirstNameValid,
        isLastNameValid,
        isConfirmPasswordValid,
        isTermsOfServiceAgreed,
        isOtpValueValid,
        fieldValidationStatus,
      ];
}
