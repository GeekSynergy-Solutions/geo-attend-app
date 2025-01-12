import 'package:geoattend/domain/entity/response/attendance/hostAttendanceAnalytics/host_attendance_analytics_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_attendance_analytics_data_model.g.dart';

@JsonSerializable()
class HostAttendanceAnalyticsDataModel extends HostAttendanceAnalyticsDataResponse {
  const HostAttendanceAnalyticsDataModel({
    required super.period,
    required super.total,
  });

  factory HostAttendanceAnalyticsDataModel.fromJson(Map<String, dynamic> json) {
    return _$HostAttendanceAnalyticsDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HostAttendanceAnalyticsDataModelToJson(this);
  }
}


