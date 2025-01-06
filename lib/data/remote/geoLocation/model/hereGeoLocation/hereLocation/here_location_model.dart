import 'package:geoattend/domain/entity/response/geoLocation/hereGeoLocation/here_geo_location_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'here_location_model.g.dart';

const customHereLocationAnnotation =
    JsonSerializable(converters: [CustomHereLocationDataConverter()]);

@customHereLocationAnnotation
class HereLocationModel extends HereGeoLocationResponse {
  const HereLocationModel({
    required super.items,
  });

  factory HereLocationModel.fromJson(Map<String, dynamic> json) {
    return _$HereLocationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HereLocationModelToJson(this);
  }
}
