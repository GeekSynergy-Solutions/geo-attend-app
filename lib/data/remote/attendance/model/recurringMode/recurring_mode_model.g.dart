// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recurring_mode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecurringModeModel _$RecurringModeModelFromJson(Map<String, dynamic> json) =>
    RecurringModeModel(
      recurringModes: (json['recurringModes'] as List<dynamic>)
          .map((e) => const CustomRecurringModeDataResponse()
              .fromJson(e as RecurringModeDataModel))
          .toList(),
    );

Map<String, dynamic> _$RecurringModeModelToJson(RecurringModeModel instance) =>
    <String, dynamic>{
      'recurringModes': instance.recurringModes
          .map(const CustomRecurringModeDataResponse().toJson)
          .toList(),
    };
