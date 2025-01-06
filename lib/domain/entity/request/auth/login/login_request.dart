import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest extends Equatable {
  const LoginRequest({
    required this.email,
    required this.password,
    required this.deviceName,
    required this.deviceId,
  });

  final String email;
  final String password;
  final String deviceName;
  final String deviceId;

  @override
  List<Object?> get props => [
        email,
        password,
        deviceId,
        deviceName,
      ];

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return _$LoginRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginRequestToJson(this);
  }
}
