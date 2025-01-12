import 'package:geoattend/domain/entity/response/attendance/totalAttendanceCreated/total_attendance_created_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total_attendance_created_model.g.dart';

@JsonSerializable()
class TotalAttendanceCreatedModel extends TotalAttendanceCreatedResponse {
  const TotalAttendanceCreatedModel({
    required super.total,
  });

  factory TotalAttendanceCreatedModel.fromJson(Map<String, dynamic> json) {
    return _$TotalAttendanceCreatedModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TotalAttendanceCreatedModelToJson(this);
  }
}
