// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'here_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HereAddressModel _$HereAddressModelFromJson(Map<String, dynamic> json) =>
    HereAddressModel(
      city: json['city'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      county: json['county'] as String?,
      district: json['district'] as String?,
      houseNumber: json['houseNumber'] as String?,
      label: json['label'] as String,
      postalCode: json['postalCode'] as String?,
      state: json['state'] as String?,
      stateCode: json['stateCode'] as String?,
      street: json['street'] as String?,
    );

Map<String, dynamic> _$HereAddressModelToJson(HereAddressModel instance) =>
    <String, dynamic>{
      'label': instance.label,
      'countryCode': instance.countryCode,
      'countryName': instance.countryName,
      'stateCode': instance.stateCode,
      'state': instance.state,
      'county': instance.county,
      'city': instance.city,
      'district': instance.district,
      'street': instance.street,
      'postalCode': instance.postalCode,
      'houseNumber': instance.houseNumber,
    };
