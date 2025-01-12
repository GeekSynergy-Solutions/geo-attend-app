// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendee_attendance_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttendeeAttendanceAnalyticsModel _$AttendeeAttendanceAnalyticsModelFromJson(
        Map<String, dynamic> json) =>
    AttendeeAttendanceAnalyticsModel(
      periodType: json['periodType'] as String,
      periodValue: json['periodValue'] as num,
      dataAnalytics: (json['dataAnalytics'] as List<dynamic>)
          .map((e) => const CustomAttendeeAttendanceAnalyticsDataResponse()
              .fromJson(e as AttendeeAttendanceAnalyticsDataModel))
          .toList(),
    );

Map<String, dynamic> _$AttendeeAttendanceAnalyticsModelToJson(
        AttendeeAttendanceAnalyticsModel instance) =>
    <String, dynamic>{
      'periodType': instance.periodType,
      'periodValue': instance.periodValue,
      'dataAnalytics': instance.dataAnalytics
          .map(const CustomAttendeeAttendanceAnalyticsDataResponse().toJson)
          .toList(),
    };
