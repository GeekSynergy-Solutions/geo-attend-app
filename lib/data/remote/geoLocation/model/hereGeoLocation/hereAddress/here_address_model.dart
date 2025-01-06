import 'package:geoattend/domain/entity/response/geoLocation/hereGeoLocation/hereAddress/here_address_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'here_address_model.g.dart';

@JsonSerializable()
class HereAddressModel extends HereAddressResponse {
  const HereAddressModel({
    required super.city,
    required super.countryCode,
    required super.countryName,
    required super.county,
    required super.district,
    required super.houseNumber,
    required super.label,
    required super.postalCode,
    required super.state,
    required super.stateCode,
    required super.street,
  });

  factory HereAddressModel.fromJson(Map<String, dynamic> json) {
    return _$HereAddressModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$HereAddressModelToJson(this);
  }
}
