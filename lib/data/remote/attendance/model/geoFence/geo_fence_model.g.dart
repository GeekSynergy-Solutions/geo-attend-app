// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_fence_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoFenceModel _$GeoFenceModelFromJson(Map<String, dynamic> json) =>
    GeoFenceModel(
      geoFenceTypes: (json['geoFenceTypes'] as List<dynamic>)
          .map((e) => const CustomGeoFenceDataResponse()
              .fromJson(e as GeoFenceDataModel))
          .toList(),
    );

Map<String, dynamic> _$GeoFenceModelToJson(GeoFenceModel instance) =>
    <String, dynamic>{
      'geoFenceTypes': instance.geoFenceTypes
          .map(const CustomGeoFenceDataResponse().toJson)
          .toList(),
    };
