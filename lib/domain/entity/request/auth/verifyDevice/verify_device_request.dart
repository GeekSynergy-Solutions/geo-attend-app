import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_device_request.g.dart';

@JsonSerializable()
class VerifyDeviceRequest extends Equatable {
  const VerifyDeviceRequest({
    required this.email,
    required this.otp,
  });

  final String email;
  final String otp;

  @override
  List<Object?> get props => [
        email,
        otp,
      ];

  factory VerifyDeviceRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyDeviceRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyDeviceRequestToJson(this);
  }
}
