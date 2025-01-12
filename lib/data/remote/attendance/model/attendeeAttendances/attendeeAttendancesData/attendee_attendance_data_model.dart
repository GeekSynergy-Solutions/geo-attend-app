import 'package:geoattend/data/remote/attendance/model/attendeeAttendances/attendeeAttendancesRecordDetails/attendee_attendance_record_details_model.dart';
import 'package:geoattend/domain/entity/response/attendance/attendeeAttendance/attendee_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendee_attendance_data_model.g.dart';

const customAttendanceDataResponse =
    JsonSerializable(converters: [CustomAttendeeAttendanceRecordDetailsResponse()]);

@customAttendanceDataResponse
class AttendeeAttendanceDataModel extends AttendeeAttendanceDataResponse {
  const AttendeeAttendanceDataModel({
    required super.attendanceCreationDate,
    required super.attendanceEndDate,
    required super.attendanceRecordDetails,
    required super.attendanceStartDate,
    required super.attendanceTitle,
  });

  factory AttendeeAttendanceDataModel.fromJson(Map<String, dynamic> json) {
    return _$AttendeeAttendanceDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AttendeeAttendanceDataModelToJson(this);
  }
}


