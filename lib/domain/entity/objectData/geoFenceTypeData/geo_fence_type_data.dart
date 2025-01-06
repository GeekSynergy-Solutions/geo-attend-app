// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class GeoFenceTypeData extends Equatable {
  String type;
  bool isItForRadius;

  GeoFenceTypeData({
    this.type = '',
    this.isItForRadius = false
  }){ 
    isItForRadius = type.toLowerCase() == 'radius';
  }

  @override
  List<Object?> get props => [
        type,
        isItForRadius,
      ];
}
