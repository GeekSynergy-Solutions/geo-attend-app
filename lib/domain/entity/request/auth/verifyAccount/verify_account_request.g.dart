// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyAccountRequest _$VerifyAccountRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyAccountRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyAccountRequestToJson(
        VerifyAccountRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
