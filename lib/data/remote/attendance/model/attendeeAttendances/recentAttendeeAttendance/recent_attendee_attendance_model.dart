import 'package:geoattend/data/remote/attendance/model/attendeeAttendances/attendeeAttendancesRecordDetails/attendee_attendance_record_details_model.dart';
import 'package:geoattend/domain/entity/response/attendance/attendeeAttendance/attendee_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_attendee_attendance_model.g.dart';

const customRecentAttendeeAttendanceResponse =
    JsonSerializable(converters: [CustomAttendeeAttendanceRecordDetailsResponse()]);

@customRecentAttendeeAttendanceResponse
class RecentAttendeeAttendanceModel extends RecentAttendeeAttendanceDataResponse {
  const RecentAttendeeAttendanceModel({
    required super.attendanceCreationDate,
    required super.attendanceEndDate,
    required super.attendanceRecordDetails,
    required super.attendanceStartDate,
    required super.attendanceTitle,
  });

  factory RecentAttendeeAttendanceModel.fromJson(Map<String, dynamic> json) {
    return _$RecentAttendeeAttendanceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecentAttendeeAttendanceModelToJson(this);
  }
}


