// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class DistanceRadiusData extends Equatable {
  double distance;
  double radius;

  DistanceRadiusData({
    this.distance = 0.0,
    this.radius = 0.0
  });

  @override
  List<Object?> get props => [
        distance,
        radius,
      ];
}
