import 'package:geoattend/domain/entity/response/attendance/createSession/create_session_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_session_model.g.dart';

@JsonSerializable()
class CreateSessionModel extends CreateSessionResponse {
  const CreateSessionModel({
    required super.attendanceCode,
    required super.attendanceId,
    required super.hostEmail,
    required super.hostId,
    super.hostDeviceId,
  });

  factory CreateSessionModel.fromJson(Map<String, dynamic> json) {
    return _$CreateSessionModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateSessionModelToJson(this);
  }
}
