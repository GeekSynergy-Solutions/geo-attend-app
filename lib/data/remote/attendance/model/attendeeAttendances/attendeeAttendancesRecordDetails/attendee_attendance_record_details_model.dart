import 'package:geoattend/domain/entity/response/attendance/attendeeAttendance/attendee_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendee_attendance_record_details_model.g.dart';

@JsonSerializable()
class AttendeeAttendanceRecordDetailsModel extends AttendeeAttendanceRecordDetailsResponse {
  const AttendeeAttendanceRecordDetailsModel({
    required super.recordFieldData,
    required super.recordFieldReadableTitleCase,
    required super.recordFieldTitleCamelCase,
  });

  factory AttendeeAttendanceRecordDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$AttendeeAttendanceRecordDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AttendeeAttendanceRecordDetailsModelToJson(this);
  }
}


