// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'time_zone_data.g.dart';

@JsonSerializable()
class TimeZoneData extends Equatable {
  TimeZoneData({
    required this.abbr,
    required this.value,
    required this.offset,
    this.isItAPositiveOffset = false,
  }){
    isItAPositiveOffset = offset > 0;
  }

  final String abbr;
  final String value;
  final int offset;
  bool? isItAPositiveOffset;

  @override
  List<Object?> get props => [
        abbr,
        value,
        offset,
        isItAPositiveOffset,
      ];

  factory TimeZoneData.fromJson(Map<String, dynamic> json) {
    return _$TimeZoneDataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TimeZoneDataToJson(this);
  }
}
