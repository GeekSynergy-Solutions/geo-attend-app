// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class SetUpGeoFenceValidation extends Equatable {
  bool isLocationAddressValid;
  bool isLocationPositionLatValid;
  bool isLocationPositionLngValid;
  bool isGeoFenceMethodValid;
  bool isGeoLocationMapValid;

  SetUpGeoFenceValidation({
    this.isLocationAddressValid = false,
    this.isLocationPositionLatValid = false,
    this.isLocationPositionLngValid = false,
    this.isGeoFenceMethodValid = false,
    this.isGeoLocationMapValid = false,
  });

  @override
  List<Object?> get props => [
        isLocationAddressValid,
        isLocationPositionLatValid,
        isLocationPositionLngValid,
        isGeoFenceMethodValid,
        isGeoLocationMapValid,
      ];
}
