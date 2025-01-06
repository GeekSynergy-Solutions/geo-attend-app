// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSessionModel _$CreateSessionModelFromJson(Map<String, dynamic> json) =>
    CreateSessionModel(
      attendanceCode: json['attendanceCode'] as String,
      attendanceId: json['attendanceId'] as String,
      hostEmail: json['hostEmail'] as String,
      hostId: json['hostId'] as String,
      hostDeviceId: json['hostDeviceId'] as String? ?? '',
    );

Map<String, dynamic> _$CreateSessionModelToJson(CreateSessionModel instance) =>
    <String, dynamic>{
      'attendanceId': instance.attendanceId,
      'hostId': instance.hostId,
      'hostEmail': instance.hostEmail,
      'hostDeviceId': instance.hostDeviceId,
      'attendanceCode': instance.attendanceCode,
    };
