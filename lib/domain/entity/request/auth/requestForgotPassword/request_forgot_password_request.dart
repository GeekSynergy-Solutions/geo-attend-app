import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_forgot_password_request.g.dart';

@JsonSerializable()
class RequestForgotPasswordRequest extends Equatable {
  const RequestForgotPasswordRequest({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [
        email,
  ];

  factory RequestForgotPasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$RequestForgotPasswordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RequestForgotPasswordRequestToJson(this);
  }
}
