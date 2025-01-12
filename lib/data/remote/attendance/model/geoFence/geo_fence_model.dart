import 'package:geoattend/data/remote/attendance/model/geoFence/geoFenceData/geo_fence_data_model.dart';
import 'package:geoattend/domain/entity/response/attendance/geoFence/geo_fence_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo_fence_model.g.dart';

const customGeoFenceDataAnnotation =
    JsonSerializable(converters: [CustomGeoFenceDataResponse()]);

@customGeoFenceDataAnnotation
class GeoFenceModel extends GeoFenceResponse {
  const GeoFenceModel({
    required super.geoFenceTypes,
  });

  factory GeoFenceModel.fromJson(Map<String, dynamic> json) {
    return _$GeoFenceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeoFenceModelToJson(this);
  }
}

