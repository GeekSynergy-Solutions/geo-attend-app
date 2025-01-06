// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'here_location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HereLocationModel _$HereLocationModelFromJson(Map<String, dynamic> json) =>
    HereLocationModel(
      items: (json['items'] as List<dynamic>)
          .map((e) => const CustomHereLocationDataConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HereLocationModelToJson(HereLocationModel instance) =>
    <String, dynamic>{
      'items': instance.items
          .map(const CustomHereLocationDataConverter().toJson)
          .toList(),
    };
