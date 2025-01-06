import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_response.g.dart';

@JsonSerializable()
class SuccessResponse extends Equatable {
  final String? title;
  final String message;
  final dynamic status;
  final int code;
  final dynamic data;
  final dynamic errors;

  const SuccessResponse({
    this.message = '',
    this.title = '',
    this.status = true,
    this.code = 0,
    this.data = '',
    this.errors = '',
  });

  @override
  List<Object?> get props => [
        title,
        message,
        status,
        code,
        data,
        errors,
      ];

  factory SuccessResponse.fromJson(Map<String, dynamic> json) {
    return _$SuccessResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SuccessResponseToJson(this);
  }
}
