import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parameter_type_request.g.dart';

@JsonSerializable()
class ParameterTypeRequest extends Equatable {
  const ParameterTypeRequest({
    required this.name,
    required this.isRequired,
  });

  final String name;
  final bool isRequired;

  @override
  List<Object?> get props => [
        name, isRequired
      ];

  factory ParameterTypeRequest.fromJson(Map<String, dynamic> json) {
    return _$ParameterTypeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ParameterTypeRequestToJson(this);
  }
}


class CustomParameterTypeConverter
    extends JsonConverter<ParameterTypeRequest, Map<String, dynamic>> {
  const CustomParameterTypeConverter();
  @override
  fromJson(json) {
    return ParameterTypeRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}