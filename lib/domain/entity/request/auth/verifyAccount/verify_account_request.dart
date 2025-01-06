import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_account_request.g.dart';

@JsonSerializable()
class VerifyAccountRequest extends Equatable {
  const VerifyAccountRequest({
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

  factory VerifyAccountRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyAccountRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyAccountRequestToJson(this);
  }
}
