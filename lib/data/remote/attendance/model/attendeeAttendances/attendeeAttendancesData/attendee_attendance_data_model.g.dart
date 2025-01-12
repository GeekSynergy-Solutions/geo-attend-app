// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_attendance_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendeeAttendanceDataModel _$AttendeeAttendanceDataModelFromJson(
        Map<String, dynamic> json) =>
    AttendeeAttendanceDataModel(
      attendanceCreationDate: json['attendanceCreationDate'] as String,
      attendanceEndDate: json['attendanceEndDate'] as String,
      attendanceRecordDetails: (json['attendanceRecordDetails']
              as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => const CustomAttendeeAttendanceRecordDetailsResponse()
                  .fromJson(e as AttendeeAttendanceRecordDetailsModel))
              .toList())
          .toList(),
      attendanceStartDate: json['attendanceStartDate'] as String,
      attendanceTitle: json['attendanceTitle'] as String,
    );

Map<String, dynamic> _$AttendeeAttendanceDataModelToJson(
        AttendeeAttendanceDataModel instance) =>
    <String, dynamic>{
      'attendanceTitle': instance.attendanceTitle,
      'attendanceStartDate': instance.attendanceStartDate,
      'attendanceEndDate': instance.attendanceEndDate,
      'attendanceCreationDate': instance.attendanceCreationDate,
      'attendanceRecordDetails': instance.attendanceRecordDetails
          .map((e) => e
              .map(const CustomAttendeeAttendanceRecordDetailsResponse().toJson)
              .toList())
          .toList(),
    };
