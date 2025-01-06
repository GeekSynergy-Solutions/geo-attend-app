import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_account_request.g.dart';

@JsonSerializable()
class CreateAccountRequest extends Equatable {
  const CreateAccountRequest({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.firstName,
    required this.lastName,
    required this.deviceId,
    required this.deviceName,
    required this.acceptTerms,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String deviceName;
  final String deviceId;
  final bool acceptTerms;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        deviceName,
        deviceId,
        acceptTerms,
      ];

  factory CreateAccountRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateAccountRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateAccountRequestToJson(this);
  }
}
