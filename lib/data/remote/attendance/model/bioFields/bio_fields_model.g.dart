// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bio_fields_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BioFieldsModel _$BioFieldsModelFromJson(Map<String, dynamic> json) =>
    BioFieldsModel(
      dbFields: json['dbFields'] as List<dynamic>,
      readableFields: (json['readableFields'] as List<dynamic>)
          .map((e) => const CustomReadableBioFieldsResponse()
              .fromJson(e as ReadableBioFieldsModel))
          .toList(),
    );

Map<String, dynamic> _$BioFieldsModelToJson(BioFieldsModel instance) =>
    <String, dynamic>{
      'dbFields': instance.dbFields,
      'readableFields': instance.readableFields
          .map(const CustomReadableBioFieldsResponse().toJson)
          .toList(),
    };
