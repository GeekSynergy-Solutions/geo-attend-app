// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class ErrorResponse extends Equatable {
  final String? title;
  String? message;
  String? error;

  ErrorResponse({
    this.message = '',
    this.title = 'Error occured, do try again',
    this.error = '',
  }) {
    message = error!.isNotEmpty
        ? error
        : message!.isNotEmpty
            ? message
            : title;
  }

  @override
  List<Object?> get props => [
        message,
        error,
        title,
      ];

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return _$ErrorResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ErrorResponseToJson(this);
  }
}
