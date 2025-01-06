// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyDeviceRequest _$VerifyDeviceRequestFromJson(Map<String, dynamic> json) =>
    VerifyDeviceRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyDeviceRequestToJson(
        VerifyDeviceRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
