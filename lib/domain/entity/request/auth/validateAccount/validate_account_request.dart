import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'validate_account_request.g.dart';

@JsonSerializable()
class ValidateAccountRequest extends Equatable {
  const ValidateAccountRequest({
    required this.email,
  });

  final String email;

  @override
  List<Object?> get props => [
        email,
      ];

  factory ValidateAccountRequest.fromJson(Map<String, dynamic> json) {
    return _$ValidateAccountRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ValidateAccountRequestToJson(this);
  }
}
