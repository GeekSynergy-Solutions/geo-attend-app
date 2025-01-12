import 'package:geoattend/domain/entity/response/attendance/attendeeAnalytics/attendee_analytics_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendee_attendance_analytics_data_model.g.dart';

@JsonSerializable()
class AttendeeAttendanceAnalyticsDataModel extends AttendeeAttendanceAnalyticsDataResponse {
  const AttendeeAttendanceAnalyticsDataModel({
    required super.period,
    required super.total,
  });

  factory AttendeeAttendanceAnalyticsDataModel.fromJson(Map<String, dynamic> json) {
    return _$AttendeeAttendanceAnalyticsDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AttendeeAttendanceAnalyticsDataModelToJson(this);
  }
}


