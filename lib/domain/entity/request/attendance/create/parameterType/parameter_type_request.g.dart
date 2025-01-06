// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parameter_type_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParameterTypeRequest _$ParameterTypeRequestFromJson(
        Map<String, dynamic> json) =>
    ParameterTypeRequest(
      name: json['name'] as String,
      isRequired: json['isRequired'] as bool,
    );

Map<String, dynamic> _$ParameterTypeRequestToJson(
        ParameterTypeRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'isRequired': instance.isRequired,
    };
