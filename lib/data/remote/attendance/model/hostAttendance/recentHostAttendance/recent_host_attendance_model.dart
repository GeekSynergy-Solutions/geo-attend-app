import 'package:geoattend/data/remote/attendance/model/hostAttendance/hostAttendancesRecordDetails/host_attendance_record_details_model.dart';
import 'package:geoattend/domain/entity/response/attendance/hostAttendance/host_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_host_attendance_model.g.dart';

const customRecentHostAttendanceResponse =
    JsonSerializable(converters: [CustomHostAttendanceRecordDetailsResponse()]);

@customRecentHostAttendanceResponse
class RecentHostAttendanceModel extends RecentHostAttendanceDataResponse {
  const RecentHostAttendanceModel({
    required super.attendanceCreationDate,
    required super.attendanceEndDate,
    required super.attendanceRecordDetails,
    required super.attendanceStartDate,
    required super.attendanceTitle,
  });

  factory RecentHostAttendanceModel.fromJson(Map<String, dynamic> json) {
    return _$RecentHostAttendanceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RecentHostAttendanceModelToJson(this);
  }
}


