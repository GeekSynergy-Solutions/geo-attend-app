// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_fence_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoFenceDataRequest _$GeoFenceDataRequestFromJson(Map<String, dynamic> json) =>
    GeoFenceDataRequest(
      polygon: _$JsonConverterFromJson<Map<String, dynamic>, PolygonRequest>(
          json['polygon'], const CustomPolygonConverter().fromJson),
      radius: _$JsonConverterFromJson<Map<String, dynamic>, RadiusRequest>(
          json['radius'], const CustomRadiusConverter().fromJson),
    );

Map<String, dynamic> _$GeoFenceDataRequestToJson(
        GeoFenceDataRequest instance) =>
    <String, dynamic>{
      'polygon': _$JsonConverterToJson<Map<String, dynamic>, PolygonRequest>(
          instance.polygon, const CustomPolygonConverter().toJson),
      'radius': _$JsonConverterToJson<Map<String, dynamic>, RadiusRequest>(
          instance.radius, const CustomRadiusConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
