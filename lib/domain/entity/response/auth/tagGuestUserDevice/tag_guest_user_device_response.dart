import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/auth/model/user/user_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomUserDataConverter
    extends JsonConverter<UserDataModel, Map<String, dynamic>> {
  const CustomUserDataConverter();
  @override
  fromJson(json) {
    return UserDataModel.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}

class TagGuestUserDeviceResponse extends Equatable {
  final String message;
  final UserDataModel user;

  const TagGuestUserDeviceResponse({
    required this.message,
    required this.user,
  });

  @override
  List<Object?> get props => [message, user];
}
