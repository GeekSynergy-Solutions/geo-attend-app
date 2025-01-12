// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AnalyticsIntervalData extends Equatable{
  String interval;
  int id;

  AnalyticsIntervalData({
    required this.interval,
    required this.id,
  });
  
  @override
  List<Object?> get props => [
    interval,
    id,
  ];
}
