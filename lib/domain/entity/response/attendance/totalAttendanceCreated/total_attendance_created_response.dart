import 'package:equatable/equatable.dart';

class TotalAttendanceCreatedResponse extends Equatable {
  const TotalAttendanceCreatedResponse({
    required this.total,
  });

  final num total;

  @override
  List<Object?> get props => [
        total,
      ];
}
