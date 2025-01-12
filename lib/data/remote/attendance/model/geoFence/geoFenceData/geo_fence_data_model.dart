import 'package:geoattend/domain/entity/response/attendance/geoFence/geo_fence_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'geo_fence_data_model.g.dart';

@JsonSerializable()
class GeoFenceDataModel extends GeoFenceDataResponse {
  const GeoFenceDataModel({
    required super.geoFenceTypeId,
    required super.geoFenceType,
  });

  factory GeoFenceDataModel.fromJson(Map<String, dynamic> json) {
    return _$GeoFenceDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GeoFenceDataModelToJson(this);
  }
}


