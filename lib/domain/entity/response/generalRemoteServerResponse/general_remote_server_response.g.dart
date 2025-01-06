// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_remote_server_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralRemoteServerResponse _$GeneralRemoteServerResponseFromJson(
        Map<String, dynamic> json) =>
    GeneralRemoteServerResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      data: json['data'] ?? const {},
      isThereAVaildationError:
          json['isThereAVaildationError'] as bool? ?? false,
      requestMethodNotAllowed:
          json['requestMethodNotAllowed'] as bool? ?? false,
      badGateWay: json['badGateWay'] as bool? ?? false,
    );

Map<String, dynamic> _$GeneralRemoteServerResponseToJson(
        GeneralRemoteServerResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'data': instance.data,
      'isThereAVaildationError': instance.isThereAVaildationError,
      'requestMethodNotAllowed': instance.requestMethodNotAllowed,
      'badGateWay': instance.badGateWay,
    };
