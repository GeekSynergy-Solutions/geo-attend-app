import 'package:geoattend/data/remote/attendance/model/hostAttendance/hostAttendancesData/host_attendance_data_model.dart';
import 'package:geoattend/domain/entity/response/attendance/hostAttendance/host_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'host_attendances_model.g.dart';

const customHostAttendanceResponse =
    JsonSerializable(converters: [CustomHostAttendanceDataResponse()]);

@customHostAttendanceResponse
class HostAttendancesModel extends HostAttendanceResponse {
  const HostAttendancesModel({
    required super.attendance,
  });

  factory HostAttendancesModel.fromJson(Map<String, dynamic> json) {
    return _$HostAttendancesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HostAttendancesModelToJson(this);
  }
}


