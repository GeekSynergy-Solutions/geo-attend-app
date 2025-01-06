import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resend_acc_verification_request.g.dart';

@JsonSerializable()
class ResendAccVerificationRequest extends Equatable {
  const ResendAccVerificationRequest({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];

  factory ResendAccVerificationRequest.fromJson(Map<String, dynamic> json) {
    return _$ResendAccVerificationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResendAccVerificationRequestToJson(this);
  }
}
