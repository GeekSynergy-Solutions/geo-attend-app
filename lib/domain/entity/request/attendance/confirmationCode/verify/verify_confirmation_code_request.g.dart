// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_confirmation_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyConfirmationCodeRequest _$VerifyConfirmationCodeRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyConfirmationCodeRequest(
      attendanceId: json['attendanceId'] as String,
      latlng: const CustomConfirmationLatLng()
          .fromJson(json['latlng'] as ConfirmationCodeLatLngRequest),
    );

Map<String, dynamic> _$VerifyConfirmationCodeRequestToJson(
        VerifyConfirmationCodeRequest instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'latlng': const CustomConfirmationLatLng().toJson(instance.latlng),
    };
