// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteErrorResponse _$RemoteErrorResponseFromJson(Map<String, dynamic> json) =>
    RemoteErrorResponse(
      errors: json['errors'],
      title: json['title'] as String? ?? 'Error',
      message: json['message'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 400,
    );

Map<String, dynamic> _$RemoteErrorResponseToJson(
        RemoteErrorResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'status': instance.status,
      'errors': instance.errors,
    };
