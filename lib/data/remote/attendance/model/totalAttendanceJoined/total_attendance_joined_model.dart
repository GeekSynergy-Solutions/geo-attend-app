import 'package:geoattend/domain/entity/response/attendance/totalAttendanceJoined/total_attendance_joined_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total_attendance_joined_model.g.dart';

@JsonSerializable()
class TotalAttendanceJoinedModel extends TotalAttendanceJoinedResponse {
  const TotalAttendanceJoinedModel({
    required super.total,
  });

  factory TotalAttendanceJoinedModel.fromJson(Map<String, dynamic> json) {
    return _$TotalAttendanceJoinedModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TotalAttendanceJoinedModelToJson(this);
  }
}
