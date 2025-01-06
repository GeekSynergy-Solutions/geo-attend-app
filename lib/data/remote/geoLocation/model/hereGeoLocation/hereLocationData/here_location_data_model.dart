import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/herePosition/here_position_model.dart';
import 'package:geoattend/domain/entity/response/geoLocation/hereGeoLocation/here_geo_location_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'here_location_data_model.g.dart';

const customHereLocationDataAnnotation =
    JsonSerializable(converters: [CustomHereAddressDataConverter(), CustomHerePositionDataConverter()]);

@customHereLocationDataAnnotation
class HereLocationDataModel extends HereGeoLocationDataResponse {
  const HereLocationDataModel({
    required super.address,
    required super.position,
  });

  factory HereLocationDataModel.fromJson(Map<String, dynamic> json) {
    return _$HereLocationDataModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HereLocationDataModelToJson(this);
  }
}
