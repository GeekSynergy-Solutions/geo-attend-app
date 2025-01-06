// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class MapTileData extends Equatable {
  int x;
  int y;
  int z;

  MapTileData({
    this.x = 3,
    this.y = 4,
    this.z = 13,
  });

  @override
  List<Object?> get props => [x, y, z];
}
