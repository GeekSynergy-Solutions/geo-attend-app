// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

class GeoFenceValuesData extends Equatable {
  double circularRadius;
  double polygonRadius;
  List<LatLng> polygonPoints;
  List<LatLng> circularPoints;
  bool isItForRadius;

  GeoFenceValuesData(
      {this.circularRadius = 0.0,
      this.polygonRadius = 0.0,
      this.polygonPoints = const [],
      this.circularPoints = const [],
      this.isItForRadius = false});

  @override
  List<Object?> get props => [
        circularRadius,
        polygonRadius,
        polygonPoints,
        circularPoints,
        isItForRadius,
      ];
}
