// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_field_data_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FormFieldDataRequest _$FormFieldDataRequestFromJson(
        Map<String, dynamic> json) =>
    FormFieldDataRequest(
      fieldName: json['fieldName'] as String,
      fieldType: json['fieldType'] as String,
      required: json['required'] as bool,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FormFieldDataRequestToJson(
        FormFieldDataRequest instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'fieldType': instance.fieldType,
      'required': instance.required,
      'options': instance.options,
    };
