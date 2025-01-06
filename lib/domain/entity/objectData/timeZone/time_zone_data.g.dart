// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_zone_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeZoneData _$TimeZoneDataFromJson(Map<String, dynamic> json) => TimeZoneData(
      abbr: json['abbr'] as String,
      value: json['value'] as String,
      offset: (json['offset'] as num).toInt(),
      isItAPositiveOffset: json['isItAPositiveOffset'] as bool? ?? false,
    );

Map<String, dynamic> _$TimeZoneDataToJson(TimeZoneData instance) =>
    <String, dynamic>{
      'abbr': instance.abbr,
      'value': instance.value,
      'offset': instance.offset,
      'isItAPositiveOffset': instance.isItAPositiveOffset,
    };
