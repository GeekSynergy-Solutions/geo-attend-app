import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'form_field_data_request.g.dart';

@JsonSerializable()
class FormFieldDataRequest extends Equatable {
  const FormFieldDataRequest({
    required this.fieldName,
    required this.fieldType,
    required this.required,
    required this.options,
  });

  final String fieldName;
  final String fieldType;
  final bool required;
  final List<String> options;

  @override
  List<Object?> get props => [
        fieldName,
        fieldType,
        required,
        options,
      ];

  factory FormFieldDataRequest.fromJson(Map<String, dynamic> json) {
    return _$FormFieldDataRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$FormFieldDataRequestToJson(this);
  }
}


class CustomFormFieldDataConverter
    extends JsonConverter<FormFieldDataRequest, Map<String, dynamic>> {
  const CustomFormFieldDataConverter();
  @override
  fromJson(json) {
    return FormFieldDataRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}