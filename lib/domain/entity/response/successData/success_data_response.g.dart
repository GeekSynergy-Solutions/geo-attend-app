// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessDataResponse _$SuccessDataResponseFromJson(Map<String, dynamic> json) =>
    SuccessDataResponse(
      message: json['message'] as String? ?? 'Successful',
      status: json['status'] as bool? ?? true,
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SuccessDataResponseToJson(
        SuccessDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
    };
