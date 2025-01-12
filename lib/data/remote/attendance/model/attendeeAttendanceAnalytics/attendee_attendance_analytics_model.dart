import 'package:geoattend/data/remote/attendance/model/attendeeAttendanceAnalytics/attendeeAttendanceAnalyticsData/attendee_attendance_analytics_data_model.dart';
import 'package:geoattend/domain/entity/response/attendance/attendeeAnalytics/attendee_analytics_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendee_attendance_analytics_model.g.dart';

const customAttendeeAttendanceAnalyticsDataAnnotation =
    JsonSerializable(converters: [CustomAttendeeAttendanceAnalyticsDataResponse()]);

@customAttendeeAttendanceAnalyticsDataAnnotation
class AttendeeAttendanceAnalyticsModel extends AttendeeAttendanceAnalyticsResponse {
  const AttendeeAttendanceAnalyticsModel({
    required super.periodType,
    required super.periodValue,
    required super.dataAnalytics,
  });

  factory AttendeeAttendanceAnalyticsModel.fromJson(Map<String, dynamic> json) {
    return _$AttendeeAttendanceAnalyticsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AttendeeAttendanceAnalyticsModelToJson(this);
  }
}


