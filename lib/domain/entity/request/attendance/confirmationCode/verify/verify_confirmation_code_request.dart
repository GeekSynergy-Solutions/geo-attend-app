import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/request/attendance/confirmationCode/confirmationCodeLatLng/confirmation_code_lat_lng_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_confirmation_code_request.g.dart';

const customSendConfirmationCodeAnnotation =
    JsonSerializable(converters: [CustomConfirmationLatLng()]);

@customSendConfirmationCodeAnnotation
class VerifyConfirmationCodeRequest extends Equatable {
  const VerifyConfirmationCodeRequest({
    required this.attendanceId,
    required this.latlng,
  });

  final String attendanceId;
  final ConfirmationCodeLatLngRequest latlng;

  @override
  List<Object?> get props => [
        attendanceId,
        latlng,
      ];

  factory VerifyConfirmationCodeRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyConfirmationCodeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VerifyConfirmationCodeRequestToJson(this);
  }
}
