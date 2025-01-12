import 'package:geoattend/data/remote/attendance/model/attendeeAttendances/attendeeAttendancesData/attendee_attendance_data_model.dart';
import 'package:geoattend/domain/entity/response/attendance/attendeeAttendance/attendee_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attendee_attendances_model.g.dart';

const customAttendanceResponse =
    JsonSerializable(converters: [CustomAttendeeAttendanceDataResponse()]);

@customAttendanceResponse
class AttendeeAttendancesModel extends AttendeeAttendanceResponse {
  const AttendeeAttendancesModel({
    required super.attendance,
  });

  factory AttendeeAttendancesModel.fromJson(Map<String, dynamic> json) {
    return _$AttendeeAttendancesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AttendeeAttendancesModelToJson(this);
  }
}


