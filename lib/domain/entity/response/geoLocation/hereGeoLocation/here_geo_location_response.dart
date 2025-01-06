import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereAddress/here_address_model.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocationData/here_location_data_model.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/herePosition/here_position_model.dart';
import 'package:json_annotation/json_annotation.dart';

class CustomHereAddressDataConverter
    extends JsonConverter<HereAddressModel, Map<String, dynamic>> {
  const CustomHereAddressDataConverter();
  @override
  fromJson(json) {
    return HereAddressModel.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}

class CustomHerePositionDataConverter
    extends JsonConverter<HerePositionModel, Map<String, dynamic>> {
  const CustomHerePositionDataConverter();
  @override
  fromJson(json) {
    return HerePositionModel.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}

class CustomHereLocationDataConverter
    extends JsonConverter<HereLocationDataModel, Map<String, dynamic>> {
  const CustomHereLocationDataConverter();
  @override
  fromJson(json) {
    return HereLocationDataModel.fromJson(json);
  }

  @override
  toJson(object) {
    return object.toJson();
  }
}

class HereGeoLocationResponse extends Equatable {
  final List<HereLocationDataModel> items;

  const HereGeoLocationResponse({
    required this.items,
  });

  @override
  List<Object?> get props => [
        items,
      ];
}

class HereGeoLocationDataResponse extends Equatable {
  final HereAddressModel address;
  final HerePositionModel? position;

  const HereGeoLocationDataResponse({
    required this.address,
    this.position,
  });

  @override
  List<Object?> get props => [
        address,
        position,
      ];
}
