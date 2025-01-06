import 'package:equatable/equatable.dart';

class RecurringOptionData extends Equatable {
  final String option;

  const RecurringOptionData({
    required this.option,
  });

  @override
  List<Object?> get props => [
        option,
      ];
}
