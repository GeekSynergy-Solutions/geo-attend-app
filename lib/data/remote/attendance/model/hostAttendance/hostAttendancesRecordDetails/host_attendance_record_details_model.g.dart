// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_attendance_record_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostAttendanceRecordDetailsModel _$HostAttendanceRecordDetailsModelFromJson(
        Map<String, dynamic> json) =>
    HostAttendanceRecordDetailsModel(
      recordFieldData: json['recordFieldData'] as String,
      recordFieldReadableTitleCase:
          json['recordFieldReadableTitleCase'] as String,
      recordFieldTitleCamelCase: json['recordFieldTitleCamelCase'] as String,
    );

Map<String, dynamic> _$HostAttendanceRecordDetailsModelToJson(
        HostAttendanceRecordDetailsModel instance) =>
    <String, dynamic>{
      'recordFieldData': instance.recordFieldData,
      'recordFieldTitleCamelCase': instance.recordFieldTitleCamelCase,
      'recordFieldReadableTitleCase': instance.recordFieldReadableTitleCase,
    };
