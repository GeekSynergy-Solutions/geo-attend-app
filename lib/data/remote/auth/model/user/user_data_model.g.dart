// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      deviceId: json['deviceId'] as String,
      deviceTag: json['deviceTag'] as String,
      id: json['id'] as String,
      serialNumber: json['serialNumber'] as String,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'deviceId': instance.deviceId,
      'serialNumber': instance.serialNumber,
      'deviceTag': instance.deviceTag,
    };
