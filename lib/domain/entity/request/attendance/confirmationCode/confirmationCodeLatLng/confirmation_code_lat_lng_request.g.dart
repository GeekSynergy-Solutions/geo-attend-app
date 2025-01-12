// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirmation_code_lat_lng_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmationCodeLatLngRequest _$ConfirmationCodeLatLngRequestFromJson(
        Map<String, dynamic> json) =>
    ConfirmationCodeLatLngRequest(
      userLat: json['userLat'] as num,
      userLng: json['userLng'] as num,
    );

Map<String, dynamic> _$ConfirmationCodeLatLngRequestToJson(
        ConfirmationCodeLatLngRequest instance) =>
    <String, dynamic>{
      'userLat': instance.userLat,
      'userLng': instance.userLng,
    };
