import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/request/attendance/create/polygon/polygon_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/radius/radius_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo_fence_data_request.g.dart';

const customGeoFenceDataAnnotation =
    JsonSerializable(converters: [CustomRadiusConverter(), CustomPolygonConverter()]);

@customGeoFenceDataAnnotation
class GeoFenceDataRequest extends Equatable {
  const GeoFenceDataRequest({
    this.polygon,
    this.radius,
  });

  final PolygonRequest? polygon;
  final RadiusRequest? radius;

  @override
  List<Object?> get props => [
        radius,
        polygon,
      ];

  factory GeoFenceDataRequest.fromJson(Map<String, dynamic> json) {
    return _$GeoFenceDataRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeoFenceDataRequestToJson(this);
  }
}


class CustomGeoFenceDataConverter
    extends JsonConverter<GeoFenceDataRequest, Map<String, dynamic>> {
  const CustomGeoFenceDataConverter();
  @override
  fromJson(json) {
    return GeoFenceDataRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}
