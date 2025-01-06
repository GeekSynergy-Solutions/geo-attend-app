import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/request/attendance/create/formFieldData/form_field_data_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/geoFence/geo_fence_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/parameterType/parameter_type_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attnd_create_request.g.dart';

const customAttndCreateAnnotation =
    JsonSerializable(converters: [CustomGeoFenceConverter(), CustomFormFieldDataConverter(), CustomParameterTypeConverter()]);

@customAttndCreateAnnotation
class AttndCreateRequest extends Equatable {
  const AttndCreateRequest({
    required this.attendanceName,
    required this.attendanceDescription,
    required this.startTime,
    required this.endTime,
    required this.attendanceAddress,
    required this.geofence,
    required this.formFields,
    required this.maxFormFields,
    required this.parameters,
  });

  final String attendanceName;
  final String attendanceDescription;
  final String startTime;
  final String endTime;
  final String attendanceAddress;
  final GeoFenceRequest geofence;
  final List<FormFieldDataRequest> formFields;
  final num maxFormFields;
  final List<ParameterTypeRequest> parameters;

  @override
  List<Object?> get props => [
        attendanceName,
        attendanceDescription,
        startTime,
        endTime,
        attendanceAddress,
        geofence,
        formFields,
        maxFormFields,
        parameters,
      ];

  factory AttndCreateRequest.fromJson(Map<String, dynamic> json) {
    return _$AttndCreateRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AttndCreateRequestToJson(this);
  }
}


class CustomFormFieldDataConverter
    extends JsonConverter<AttndCreateRequest, Map<String, dynamic>> {
  const CustomFormFieldDataConverter();
  @override
  fromJson(json) {
    return AttndCreateRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}