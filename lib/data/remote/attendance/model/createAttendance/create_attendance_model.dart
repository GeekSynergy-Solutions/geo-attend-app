import 'package:geoattend/domain/entity/response/attendance/createAttendance/create_attendance_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_attendance_model.g.dart';

@JsonSerializable()
class CreateAttendanceModel extends CreateAttendanceResponse {
  const CreateAttendanceModel({
    required super.attendanceCode,
  });

  factory CreateAttendanceModel.fromJson(Map<String, dynamic> json) {
    return _$CreateAttendanceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateAttendanceModelToJson(this);
  }
}
