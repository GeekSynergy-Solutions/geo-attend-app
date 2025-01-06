// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'general_remote_server_response.g.dart';

@JsonSerializable()
class GeneralRemoteServerResponse extends Equatable {
  final int statusCode;
  dynamic data;
  bool isThereAVaildationError;
  bool requestMethodNotAllowed;
  bool badGateWay;

  GeneralRemoteServerResponse({
    required this.statusCode,
    this.data = const {},
    this.isThereAVaildationError = false,
    this.requestMethodNotAllowed = false,
    this.badGateWay = false,
  }) {
    isThereAVaildationError =
        statusCode == 400 || statusCode == 409 || statusCode == 403;
    requestMethodNotAllowed = statusCode == 405;
    badGateWay = statusCode == 502;
  }

  @override
  List<Object?> get props => [
        statusCode,
        data,
        isThereAVaildationError,
        requestMethodNotAllowed,
        badGateWay,
      ];

  factory GeneralRemoteServerResponse.fromJson(Map<String, dynamic> json) {
    return _$GeneralRemoteServerResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeneralRemoteServerResponseToJson(this);
  }
}
