// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_attendances_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostAttendancesModel _$HostAttendancesModelFromJson(
        Map<String, dynamic> json) =>
    HostAttendancesModel(
      attendance: (json['attendance'] as List<dynamic>)
          .map((e) => const CustomHostAttendanceDataResponse()
              .fromJson(e as HostAttendanceDataModel))
          .toList(),
    );

Map<String, dynamic> _$HostAttendancesModelToJson(
        HostAttendancesModel instance) =>
    <String, dynamic>{
      'attendance': instance.attendance
          .map(const CustomHostAttendanceDataResponse().toJson)
          .toList(),
    };
