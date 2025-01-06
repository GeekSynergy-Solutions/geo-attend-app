// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attnd_create_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttndCreateRequest _$AttndCreateRequestFromJson(Map<String, dynamic> json) =>
    AttndCreateRequest(
      attendanceName: json['attendanceName'] as String,
      attendanceDescription: json['attendanceDescription'] as String,
      startTime: json['startTime'] as String,
      endTime: json['endTime'] as String,
      attendanceAddress: json['attendanceAddress'] as String,
      geofence: const CustomGeoFenceConverter()
          .fromJson(json['geofence'] as Map<String, dynamic>),
      formFields: (json['formFields'] as List<dynamic>)
          .map((e) => FormFieldDataRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxFormFields: json['maxFormFields'] as num,
      parameters: (json['parameters'] as List<dynamic>)
          .map((e) => const CustomParameterTypeConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttndCreateRequestToJson(AttndCreateRequest instance) =>
    <String, dynamic>{
      'attendanceName': instance.attendanceName,
      'attendanceDescription': instance.attendanceDescription,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'attendanceAddress': instance.attendanceAddress,
      'geofence': const CustomGeoFenceConverter().toJson(instance.geofence),
      'formFields': instance.formFields,
      'maxFormFields': instance.maxFormFields,
      'parameters': instance.parameters
          .map(const CustomParameterTypeConverter().toJson)
          .toList(),
    };
