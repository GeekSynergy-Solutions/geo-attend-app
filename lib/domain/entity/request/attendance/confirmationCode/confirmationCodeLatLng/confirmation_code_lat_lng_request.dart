import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirmation_code_lat_lng_request.g.dart';

@JsonSerializable()
class ConfirmationCodeLatLngRequest extends Equatable {
  const ConfirmationCodeLatLngRequest({
    required this.userLat,
    required this.userLng,
  });

  final num userLat;
  final num userLng;

  @override
  List<Object?> get props => [
        userLat,
        userLng,
      ];

  factory ConfirmationCodeLatLngRequest.fromJson(Map<String, dynamic> json) {
    return _$ConfirmationCodeLatLngRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ConfirmationCodeLatLngRequestToJson(this);
  }
}

class CustomConfirmationLatLng extends JsonConverter<ConfirmationCodeLatLngRequest, ConfirmationCodeLatLngRequest> {
  const CustomConfirmationLatLng();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}

