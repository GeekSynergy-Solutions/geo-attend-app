import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/request/attendance/create/radiusData/radius_data_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'radius_request.g.dart';

const customRadiusDataAnnotation =
    JsonSerializable(converters: [CustomRadiusDataConverter()]);

@customRadiusDataAnnotation
class RadiusRequest extends Equatable {
  const RadiusRequest({
    required this.center,
    required this.radius,
  });

  final RadiusDataRequest center;
  final num radius;

  @override
  List<Object?> get props => [center, radius];

  factory RadiusRequest.fromJson(Map<String, dynamic> json) {
    return _$RadiusRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$RadiusRequestToJson(this);
  }
}


class CustomRadiusConverter
    extends JsonConverter<RadiusRequest, Map<String, dynamic>> {
  const CustomRadiusConverter();
  @override
  fromJson(json) {
    return RadiusRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}