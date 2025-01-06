// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'radius_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RadiusRequest _$RadiusRequestFromJson(Map<String, dynamic> json) =>
    RadiusRequest(
      center: const CustomRadiusDataConverter()
          .fromJson(json['center'] as Map<String, dynamic>),
      radius: json['radius'] as num,
    );

Map<String, dynamic> _$RadiusRequestToJson(RadiusRequest instance) =>
    <String, dynamic>{
      'center': const CustomRadiusDataConverter().toJson(instance.center),
      'radius': instance.radius,
    };
