import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_forgot_password_otp_request.g.dart';

@JsonSerializable()
class VerifyForgotPasswordOtpRequest extends Equatable {
  const VerifyForgotPasswordOtpRequest({
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

  factory VerifyForgotPasswordOtpRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyForgotPasswordOtpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyForgotPasswordOtpRequestToJson(this);
  }
}
