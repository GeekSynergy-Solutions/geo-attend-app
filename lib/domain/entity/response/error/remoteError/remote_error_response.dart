import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_error_response.g.dart';

@JsonSerializable()
class RemoteErrorResponse extends Equatable {
  final String title;
  final String? message;
  final int status;
  final dynamic errors;

  const RemoteErrorResponse({
    required this.errors,
    this.title = 'Error',
    this.message = '',
    this.status = 400,
  });

  @override
  List<Object?> get props => [
        errors,
        title,
        message,
        status,
      ];

  factory RemoteErrorResponse.fromJson(Map<String, dynamic> json) {
    return _$RemoteErrorResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RemoteErrorResponseToJson(this);
  }
}
