// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_fence_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoFenceRequest _$GeoFenceRequestFromJson(Map<String, dynamic> json) =>
    GeoFenceRequest(
      type: json['type'] as String,
      data: const CustomGeoFenceDataConverter()
          .fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeoFenceRequestToJson(GeoFenceRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'data': const CustomGeoFenceDataConverter().toJson(instance.data),
    };
