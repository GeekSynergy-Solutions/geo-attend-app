import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'polygon_request.g.dart';

@JsonSerializable()
class PolygonRequest extends Equatable {
  const PolygonRequest({
    required this.coordinates
  });

  final List<List<num>> coordinates;

  @override
  List<Object?> get props => [
        coordinates
      ];

  factory PolygonRequest.fromJson(Map<String, dynamic> json) {
    return _$PolygonRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$PolygonRequestToJson(this);
  }
}


class CustomPolygonConverter
    extends JsonConverter<PolygonRequest, Map<String, dynamic>> {
  const CustomPolygonConverter();
  @override
  fromJson(json) {
    return PolygonRequest.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}