// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_host_attendance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentHostAttendanceModel _$RecentHostAttendanceModelFromJson(
        Map<String, dynamic> json) =>
    RecentHostAttendanceModel(
      attendanceCreationDate: json['attendanceCreationDate'] as String,
      attendanceEndDate: json['attendanceEndDate'] as String,
      attendanceRecordDetails:
          (json['attendanceRecordDetails'] as List<dynamic>)
              .map((e) => (e as List<dynamic>)
                  .map((e) => const CustomHostAttendanceRecordDetailsResponse()
                      .fromJson(e as HostAttendanceRecordDetailsModel))
                  .toList())
              .toList(),
      attendanceStartDate: json['attendanceStartDate'] as String,
      attendanceTitle: json['attendanceTitle'] as String,
    );

Map<String, dynamic> _$RecentHostAttendanceModelToJson(
        RecentHostAttendanceModel instance) =>
    <String, dynamic>{
      'attendanceTitle': instance.attendanceTitle,
      'attendanceStartDate': instance.attendanceStartDate,
      'attendanceEndDate': instance.attendanceEndDate,
      'attendanceCreationDate': instance.attendanceCreationDate,
      'attendanceRecordDetails': instance.attendanceRecordDetails
          .map((e) => e
              .map(const CustomHostAttendanceRecordDetailsResponse().toJson)
              .toList())
          .toList(),
    };
