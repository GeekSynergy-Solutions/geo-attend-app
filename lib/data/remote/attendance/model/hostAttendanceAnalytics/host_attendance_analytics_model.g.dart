// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'host_attendance_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HostAttendanceAnalyticsModel _$HostAttendanceAnalyticsModelFromJson(
        Map<String, dynamic> json) =>
    HostAttendanceAnalyticsModel(
      periodType: json['periodType'] as String,
      periodValue: json['periodValue'] as num,
      dataAnalytics: (json['dataAnalytics'] as List<dynamic>)
          .map((e) => const CustomHostAttendanceAnalyticsDataResponse()
              .fromJson(e as HostAttendanceAnalyticsDataModel))
          .toList(),
    );

Map<String, dynamic> _$HostAttendanceAnalyticsModelToJson(
        HostAttendanceAnalyticsModel instance) =>
    <String, dynamic>{
      'periodType': instance.periodType,
      'periodValue': instance.periodValue,
      'dataAnalytics': instance.dataAnalytics
          .map(const CustomHostAttendanceAnalyticsDataResponse().toJson)
          .toList(),
    };
