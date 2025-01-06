// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class LocationPositionData extends Equatable {
  String location;
  num positionLat;
  num positionLng;

  LocationPositionData({
    this.location = '',
    this.positionLat = 0.0,
    this.positionLng = 0.0,
  });

  @override
  List<Object?> get props => [
        location,
        positionLat,
        positionLng,
      ];
}
