import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/geoFence/geoFenceData/geo_fence_data_model.dart';
import 'package:json_annotation/json_annotation.dart';

class GeoFenceDataResponse extends Equatable {
  const GeoFenceDataResponse({
    required this.geoFenceType,
    required this.geoFenceTypeId,
  });

  final String geoFenceType;
  final dynamic geoFenceTypeId;

  @override
  List<Object?> get props => [
        geoFenceType,
        geoFenceTypeId,
      ];
}

class GeoFenceResponse extends Equatable {
  const GeoFenceResponse({
    required this.geoFenceTypes,
  });

  final List<GeoFenceDataModel> geoFenceTypes;

  @override
  List<Object?> get props => [
        geoFenceTypes,
      ];
}

class CustomGeoFenceDataResponse extends JsonConverter<GeoFenceDataModel, GeoFenceDataModel> {
  const CustomGeoFenceDataResponse();
  @override
  fromJson(json) {
    return json;
  }

  @override
  toJson(object) {
    return object;
  }
}
