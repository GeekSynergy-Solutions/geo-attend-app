import 'package:geoattend/domain/entity/response/auth/tagGuestUserDevice/tag_guest_user_device_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag_guest_user_device_model.g.dart';

const customUserDataAnnotation =
    JsonSerializable(converters: [CustomUserDataConverter()]);

@customUserDataAnnotation
class TagGuestUserDeviceModel extends TagGuestUserDeviceResponse {
  const TagGuestUserDeviceModel({
    required super.message,
    required super.user,
  });

  factory TagGuestUserDeviceModel.fromJson(Map<String, dynamic> json) {
    return _$TagGuestUserDeviceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TagGuestUserDeviceModelToJson(this);
  }
}
