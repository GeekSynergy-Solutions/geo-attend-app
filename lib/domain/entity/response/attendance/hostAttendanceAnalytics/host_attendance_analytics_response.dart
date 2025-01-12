import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/hostAttendanceAnalytics/hostAttendanceAnalyticsData/host_attendance_analytics_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

class HostAttendanceAnalyticsDataResponse extends Equatable {
  const HostAttendanceAnalyticsDataResponse({
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

class HostAttendanceAnalyticsResponse extends Equatable {
  const HostAttendanceAnalyticsResponse({
    required this.periodType,
    required this.periodValue,
    required this.dataAnalytics,
  });

  final String periodType;
  final num periodValue;
  final List<HostAttendanceAnalyticsDataModel> dataAnalytics;

  @override
  List<Object?> get props => [
        periodType,
        periodValue,
        dataAnalytics,
      ];
}

class CustomHostAttendanceAnalyticsDataResponse extends JsonConverter<
    HostAttendanceAnalyticsDataModel, HostAttendanceAnalyticsDataModel> {
  const CustomHostAttendanceAnalyticsDataResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}
