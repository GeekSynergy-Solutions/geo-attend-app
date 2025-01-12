// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_attendance_pie_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostAttendancePieChartModel _$HostAttendancePieChartModelFromJson(
        Map<String, dynamic> json) =>
    HostAttendancePieChartModel(
      attendeesCount: json['attendeesCount'] as num,
      percentage: json['percentage'] as num,
      percentageLabel: json['percentageLabel'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$HostAttendancePieChartModelToJson(
        HostAttendancePieChartModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'attendeesCount': instance.attendeesCount,
      'percentage': instance.percentage,
      'percentageLabel': instance.percentageLabel,
    };
