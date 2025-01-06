import 'package:equatable/equatable.dart';

class UserDataResponse extends Equatable {
  final String id;
  final String deviceId;
  final String serialNumber;
  final String deviceTag;

  const UserDataResponse({
    required this.id,
    required this.deviceId,
    required this.deviceTag,
    required this.serialNumber,
  });

  @override
  List<Object?> get props => [id, deviceId, deviceTag, serialNumber];
}
