// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'here_location_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HereLocationDataModel _$HereLocationDataModelFromJson(
        Map<String, dynamic> json) =>
    HereLocationDataModel(
      address: const CustomHereAddressDataConverter()
          .fromJson(json['address'] as Map<String, dynamic>),
      position:
          _$JsonConverterFromJson<Map<String, dynamic>, HerePositionModel>(
              json['position'],
              const CustomHerePositionDataConverter().fromJson),
    );

Map<String, dynamic> _$HereLocationDataModelToJson(
        HereLocationDataModel instance) =>
    <String, dynamic>{
      'address':
          const CustomHereAddressDataConverter().toJson(instance.address),
      'position':
          _$JsonConverterToJson<Map<String, dynamic>, HerePositionModel>(
              instance.position,
              const CustomHerePositionDataConverter().toJson),
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
