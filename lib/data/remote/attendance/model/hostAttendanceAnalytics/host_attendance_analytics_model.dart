import 'package:geoattend/data/remote/attendance/model/hostAttendanceAnalytics/hostAttendanceAnalyticsData/host_attendance_analytics_data_model.dart';
import 'package:geoattend/domain/entity/response/attendance/hostAttendanceAnalytics/host_attendance_analytics_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_attendance_analytics_model.g.dart';

const customHostAttendanceAnalyticsDataAnnotation =
    JsonSerializable(converters: [CustomHostAttendanceAnalyticsDataResponse()]);

@customHostAttendanceAnalyticsDataAnnotation
class HostAttendanceAnalyticsModel extends HostAttendanceAnalyticsResponse {
  const HostAttendanceAnalyticsModel({
    required super.periodType,
    required super.periodValue,
    required super.dataAnalytics,
  });

  factory HostAttendanceAnalyticsModel.fromJson(Map<String, dynamic> json) {
    return _$HostAttendanceAnalyticsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HostAttendanceAnalyticsModelToJson(this);
  }
}
