// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_forgot_password_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyForgotPasswordOtpRequest _$VerifyForgotPasswordOtpRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyForgotPasswordOtpRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyForgotPasswordOtpRequestToJson(
        VerifyForgotPasswordOtpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
