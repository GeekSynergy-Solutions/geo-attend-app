import 'package:geoattend/domain/entity/response/geoLocation/hereGeoLocation/herePosition/here_position_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'here_position_model.g.dart';

@JsonSerializable()
class HerePositionModel extends HerePositionResponse {
  const HerePositionModel({
    required super.lat,
    required super.lng,
  });

  factory HerePositionModel.fromJson(Map<String, dynamic> json) {
    return _$HerePositionModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HerePositionModelToJson(this);
  }
}
