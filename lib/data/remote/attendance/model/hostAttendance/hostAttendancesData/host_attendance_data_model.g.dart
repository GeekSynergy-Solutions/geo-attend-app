// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_attendance_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostAttendanceDataModel _$HostAttendanceDataModelFromJson(
        Map<String, dynamic> json) =>
    HostAttendanceDataModel(
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

Map<String, dynamic> _$HostAttendanceDataModelToJson(
        HostAttendanceDataModel instance) =>
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
