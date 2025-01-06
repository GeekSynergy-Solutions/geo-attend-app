// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polygon_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolygonRequest _$PolygonRequestFromJson(Map<String, dynamic> json) =>
    PolygonRequest(
      coordinates: (json['coordinates'] as List<dynamic>)
          .map((e) => (e as List<dynamic>).map((e) => e as num).toList())
          .toList(),
    );

Map<String, dynamic> _$PolygonRequestToJson(PolygonRequest instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
    };
