import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/attendeeAttendanceAnalytics/attendeeAttendanceAnalyticsData/attendee_attendance_analytics_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

class AttendeeAttendanceAnalyticsDataResponse extends Equatable {
  const AttendeeAttendanceAnalyticsDataResponse({
    required this.period,
    required this.total,
  });

  final String period;
  final num total;

  @override
  List<Object?> get props => [
        period,
        total,
      ];
}

class AttendeeAttendanceAnalyticsResponse extends Equatable {
  const AttendeeAttendanceAnalyticsResponse({
    required this.periodType,
    required this.periodValue,
    required this.dataAnalytics,
  });

  final String periodType;
  final num periodValue;
  final List<AttendeeAttendanceAnalyticsDataModel> dataAnalytics;

  @override
  List<Object?> get props => [
        periodType,
        periodValue,
        dataAnalytics,
      ];
}

class CustomAttendeeAttendanceAnalyticsDataResponse extends JsonConverter<
    AttendeeAttendanceAnalyticsDataModel, AttendeeAttendanceAnalyticsDataModel> {
  const CustomAttendeeAttendanceAnalyticsDataResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}
