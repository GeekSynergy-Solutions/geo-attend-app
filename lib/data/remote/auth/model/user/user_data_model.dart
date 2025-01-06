import 'package:geoattend/domain/entity/response/auth/userData/user_data_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_data_model.g.dart';

@JsonSerializable()
class UserDataModel extends UserDataResponse {
  const UserDataModel({
    required super.deviceId,
    required super.deviceTag,
    required super.id,
    required super.serialNumber,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return _$UserDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserDataModelToJson(this);
  }
}
