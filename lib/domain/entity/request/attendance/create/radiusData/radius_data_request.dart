import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'radius_data_request.g.dart';

@JsonSerializable()
class RadiusDataRequest extends Equatable {
  const RadiusDataRequest({
    required this.latitude,
    required this.longitude,
  });

  final num latitude;
  final num longitude;

  @override
  List<Object?> get props => [latitude, longitude];

  factory RadiusDataRequest.fromJson(Map<String, dynamic> json) {
    return _$RadiusDataRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RadiusDataRequestToJson(this);
  }
}

class CustomRadiusDataConverter
    extends JsonConverter<RadiusDataRequest, Map<String, dynamic>> {
  const CustomRadiusDataConverter();
  @override
  fromJson(json) {
    return RadiusDataRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}
