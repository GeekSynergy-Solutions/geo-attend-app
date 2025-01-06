import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'continue_as_a_guest_request.g.dart';

@JsonSerializable()
class ContinueAsAGuestRequest extends Equatable {
  const ContinueAsAGuestRequest({
    required this.deviceId,
    required this.deviceName,
  });

  final String deviceId;
  final String deviceName;

  @override
  List<Object?> get props => [
        deviceId,
        deviceName,
      ];

  factory ContinueAsAGuestRequest.fromJson(Map<String, dynamic> json) {
    return _$ContinueAsAGuestRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ContinueAsAGuestRequestToJson(this);
  }
}
