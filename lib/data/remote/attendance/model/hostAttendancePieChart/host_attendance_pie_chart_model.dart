import 'package:geoattend/domain/entity/response/attendance/hostAttendancePieChart/host_attendance_pie_chart_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_attendance_pie_chart_model.g.dart';

@JsonSerializable()
class HostAttendancePieChartModel extends HostAttendancePieChartResponse {
  const HostAttendancePieChartModel({
    required super.attendeesCount,
    required super.percentage,
    required super.percentageLabel,
    required super.status,
  });

  factory HostAttendancePieChartModel.fromJson(Map<String, dynamic> json) {
    return _$HostAttendancePieChartModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HostAttendancePieChartModelToJson(this);
  }
}


