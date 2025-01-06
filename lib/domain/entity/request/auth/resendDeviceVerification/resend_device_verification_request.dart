import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_device_verification_request.g.dart';

@JsonSerializable()
class ResendDeviceVerificationRequest extends Equatable {
  const ResendDeviceVerificationRequest({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];

  factory ResendDeviceVerificationRequest.fromJson(Map<String, dynamic> json) {
    return _$ResendDeviceVerificationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResendDeviceVerificationRequestToJson(this);
  }
}
