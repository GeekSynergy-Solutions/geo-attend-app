import 'package:geoattend/data/remote/attendance/model/bioFields/readableFields/readable_bio_fields_model.dart';
import 'package:geoattend/domain/entity/response/attendance/bioFields/bio_fields_response.dart';
import 'package:geoattend/domain/entity/response/attendance/bioFields/readableFields/readable_bio_fields_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bio_fields_model.g.dart';

const customReadableDataResponse =
    JsonSerializable(converters: [CustomReadableBioFieldsResponse()]);

@customReadableDataResponse
class BioFieldsModel extends BioFieldsResponse {
  const BioFieldsModel({
    required super.dbFields,
    required super.readableFields,
  });

  factory BioFieldsModel.fromJson(Map<String, dynamic> json) {
    return _$BioFieldsModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BioFieldsModelToJson(this);
  }
}


