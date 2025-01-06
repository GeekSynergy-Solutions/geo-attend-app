import 'package:equatable/equatable.dart';

class HerePositionResponse extends Equatable {
  final num lat;
  final num lng;

  const HerePositionResponse({
    required this.lat,
    required this.lng,
  });

  @override
  List<Object?> get props => [
        lat,
        lng,
      ];
}
