// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_attendance_pie_chart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendeeAttendancePieChartModel _$AttendeeAttendancePieChartModelFromJson(
        Map<String, dynamic> json) =>
    AttendeeAttendancePieChartModel(
      attendeesCount: json['attendeesCount'] as num,
      percentage: json['percentage'] as num,
      percentageLabel: json['percentageLabel'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AttendeeAttendancePieChartModelToJson(
        AttendeeAttendancePieChartModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'attendeesCount': instance.attendeesCount,
      'percentage': instance.percentage,
      'percentageLabel': instance.percentageLabel,
    };
