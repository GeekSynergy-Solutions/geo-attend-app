// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      message: json['message'] as String? ?? '',
      title: json['title'] as String? ?? 'Error occured, do try again',
      error: json['error'] as String? ?? '',
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'message': instance.message,
      'error': instance.error,
    };
