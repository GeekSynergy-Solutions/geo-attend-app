import 'package:equatable/equatable.dart';
import 'package:geoattend/data/remote/attendance/model/bioFields/readableFields/readable_bio_fields_model.dart';

class BioFieldsResponse extends Equatable {
  const BioFieldsResponse({
    required this.dbFields,
    required this.readableFields,
  });

  final List dbFields;
  final List<ReadableBioFieldsModel> readableFields;

  @override
  List<Object?> get props => [
        dbFields,
        readableFields,
      ];
}