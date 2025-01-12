import 'package:geoattend/domain/entity/response/attendance/hostAttendance/host_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_attendance_record_details_model.g.dart';

@JsonSerializable()
class HostAttendanceRecordDetailsModel extends HostAttendanceRecordDetailsResponse {
  const HostAttendanceRecordDetailsModel({
    required super.recordFieldData,
    required super.recordFieldReadableTitleCase,
    required super.recordFieldTitleCamelCase,
  });

  factory HostAttendanceRecordDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$HostAttendanceRecordDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HostAttendanceRecordDetailsModelToJson(this);
  }
}


