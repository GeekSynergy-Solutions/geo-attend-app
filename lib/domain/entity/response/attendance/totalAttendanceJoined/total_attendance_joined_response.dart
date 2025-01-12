import 'package:equatable/equatable.dart';

class TotalAttendanceJoinedResponse extends Equatable {
  const TotalAttendanceJoinedResponse({
    required this.total,
  });

  final num total;

  @override
  List<Object?> get props => [
        total,
      ];
}
