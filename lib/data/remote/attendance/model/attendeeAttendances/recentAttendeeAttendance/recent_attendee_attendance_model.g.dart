// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_attendee_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentAttendeeAttendanceModel _$RecentAttendeeAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    RecentAttendeeAttendanceModel(
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

Map<String, dynamic> _$RecentAttendeeAttendanceModelToJson(
        RecentAttendeeAttendanceModel instance) =>
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
