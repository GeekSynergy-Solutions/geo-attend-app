import 'package:geoattend/domain/entity/response/attendance/attendeeAttendancePieChart/attendee_attendance_pie_chart_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendee_attendance_pie_chart_model.g.dart';

@JsonSerializable()
class AttendeeAttendancePieChartModel extends AttendeeAttendancePieChartResponse {
  const AttendeeAttendancePieChartModel({
    required super.attendeesCount,
    required super.percentage,
    required super.percentageLabel,
    required super.status,
  });

  factory AttendeeAttendancePieChartModel.fromJson(Map<String, dynamic> json) {
    return _$AttendeeAttendancePieChartModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AttendeeAttendancePieChartModelToJson(this);
  }
}


