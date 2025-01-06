import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/request/attendance/create/geoFenceData/geo_fence_data_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo_fence_request.g.dart';

const customGeoFenceAnnotation =
    JsonSerializable(converters: [CustomGeoFenceDataConverter()]);

@customGeoFenceAnnotation
class GeoFenceRequest extends Equatable {
  const GeoFenceRequest({
    required this.type,
    required this.data,
  });

  final String type;
  final GeoFenceDataRequest data;

  @override
  List<Object?> get props => [
        type,
        data,
      ];

  factory GeoFenceRequest.fromJson(Map<String, dynamic> json) {
    return _$GeoFenceRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeoFenceRequestToJson(this);
  }
}


class CustomGeoFenceConverter
    extends JsonConverter<GeoFenceRequest, Map<String, dynamic>> {
  const CustomGeoFenceConverter();
  @override
  fromJson(json) {
    return GeoFenceRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}