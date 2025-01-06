import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success_data_response.g.dart';

@JsonSerializable()
// ignore: must_be_immutable
class SuccessDataResponse extends Equatable {
  String message;
  final bool status;
  final int code;
  final Map<String, dynamic>? data;

  SuccessDataResponse({
    this.message = 'Successful',
    this.status = true,
    this.code = 0,
    this.data,
  }) {
    if (message.isEmpty) {
      message = 'Successful';
    }
  }

  @override
  List<Object?> get props => [
        message,
        status,
      ];

  factory SuccessDataResponse.fromJson(Map<String, dynamic> json) {
    return _$SuccessDataResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SuccessDataResponseToJson(this);
  }
}
