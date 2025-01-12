// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_attendances_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendeeAttendancesModel _$AttendeeAttendancesModelFromJson(
        Map<String, dynamic> json) =>
    AttendeeAttendancesModel(
      attendance: (json['attendance'] as List<dynamic>)
          .map((e) => const CustomAttendeeAttendanceDataResponse()
              .fromJson(e as AttendeeAttendanceDataModel))
          .toList(),
    );

Map<String, dynamic> _$AttendeeAttendancesModelToJson(
        AttendeeAttendancesModel instance) =>
    <String, dynamic>{
      'attendance': instance.attendance
          .map(const CustomAttendeeAttendanceDataResponse().toJson)
          .toList(),
    };
