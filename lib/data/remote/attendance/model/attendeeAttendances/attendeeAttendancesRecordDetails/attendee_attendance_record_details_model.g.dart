// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_attendance_record_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendeeAttendanceRecordDetailsModel
    _$AttendeeAttendanceRecordDetailsModelFromJson(Map<String, dynamic> json) =>
        AttendeeAttendanceRecordDetailsModel(
          recordFieldData: json['recordFieldData'] as String,
          recordFieldReadableTitleCase:
              json['recordFieldReadableTitleCase'] as String,
          recordFieldTitleCamelCase:
              json['recordFieldTitleCamelCase'] as String,
        );

Map<String, dynamic> _$AttendeeAttendanceRecordDetailsModelToJson(
        AttendeeAttendanceRecordDetailsModel instance) =>
    <String, dynamic>{
      'recordFieldData': instance.recordFieldData,
      'recordFieldTitleCamelCase': instance.recordFieldTitleCamelCase,
      'recordFieldReadableTitleCase': instance.recordFieldReadableTitleCase,
    };
