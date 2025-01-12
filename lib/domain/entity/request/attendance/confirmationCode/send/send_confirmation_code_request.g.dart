// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_confirmation_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendConfirmationCodeRequest _$SendConfirmationCodeRequestFromJson(
        Map<String, dynamic> json) =>
    SendConfirmationCodeRequest(
      attendanceId: json['attendanceId'] as String,
      latlng: const CustomConfirmationLatLng()
          .fromJson(json['latlng'] as ConfirmationCodeLatLngRequest),
    );

Map<String, dynamic> _$SendConfirmationCodeRequestToJson(
        SendConfirmationCodeRequest instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'latlng': const CustomConfirmationLatLng().toJson(instance.latlng),
    };
