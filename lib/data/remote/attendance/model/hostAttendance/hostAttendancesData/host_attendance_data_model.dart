import 'package:geoattend/data/remote/attendance/model/hostAttendance/hostAttendancesRecordDetails/host_attendance_record_details_model.dart';
import 'package:geoattend/domain/entity/response/attendance/hostAttendance/host_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_attendance_data_model.g.dart';

const customHostAttendanceDataResponse =
    JsonSerializable(converters: [CustomHostAttendanceRecordDetailsResponse()]);

@customHostAttendanceDataResponse
class HostAttendanceDataModel extends HostAttendanceDataResponse {
  const HostAttendanceDataModel({
    required super.attendanceCreationDate,
    required super.attendanceEndDate,
    required super.attendanceRecordDetails,
    required super.attendanceStartDate,
    required super.attendanceTitle,
  });

  factory HostAttendanceDataModel.fromJson(Map<String, dynamic> json) {
    return _$HostAttendanceDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HostAttendanceDataModelToJson(this);
  }
}


