// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'success_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    SuccessResponse(
      message: json['message'] as String? ?? '',
      title: json['title'] as String? ?? '',
      status: json['status'] ?? true,
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: json['data'] ?? '',
      errors: json['errors'] ?? '',
    );

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'status': instance.status,
      'code': instance.code,
      'data': instance.data,
      'errors': instance.errors,
    };
