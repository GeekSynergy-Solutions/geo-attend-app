import 'package:geoattend/domain/entity/response/attendance/sendAttendanceReport/send_attendance_report_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_attendance_report_model.g.dart';

@JsonSerializable()
class SendAttendanceReportModel extends SendAttendanceReportResponse {
  const SendAttendanceReportModel({
    required super.sendReportStatus,
  });

  factory SendAttendanceReportModel.fromJson(Map<String, dynamic> json) {
    return _$SendAttendanceReportModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SendAttendanceReportModelToJson(this);
  }
}
