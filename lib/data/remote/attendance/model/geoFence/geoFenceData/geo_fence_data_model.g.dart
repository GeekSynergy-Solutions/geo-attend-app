// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_fence_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoFenceDataModel _$GeoFenceDataModelFromJson(Map<String, dynamic> json) =>
    GeoFenceDataModel(
      geoFenceTypeId: json['geoFenceTypeId'],
      geoFenceType: json['geoFenceType'] as String,
    );

Map<String, dynamic> _$GeoFenceDataModelToJson(GeoFenceDataModel instance) =>
    <String, dynamic>{
      'geoFenceType': instance.geoFenceType,
      'geoFenceTypeId': instance.geoFenceTypeId,
    };
