// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_attendance_analytics_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostAttendanceAnalyticsDataModel _$HostAttendanceAnalyticsDataModelFromJson(
        Map<String, dynamic> json) =>
    HostAttendanceAnalyticsDataModel(
      period: json['period'] as String,
      total: json['total'] as num,
    );

Map<String, dynamic> _$HostAttendanceAnalyticsDataModelToJson(
        HostAttendanceAnalyticsDataModel instance) =>
    <String, dynamic>{
      'period': instance.period,
      'total': instance.total,
    };
