import 'package:equatable/equatable.dart';

class ReadableFieldsResponse extends Equatable {
  const ReadableFieldsResponse({
    required this.fieldNames,
    required this.readableNames,
  });

  final List<String> fieldNames;
  final List<String> readableNames;

  @override
  List<Object?> get props => [
        fieldNames,
        readableNames,
      ];
}

// class CustomConfirmationLatLng extends JsonConverter<ConfirmationCodeLatLngRequest, ConfirmationCodeLatLngRequest> {
//   const CustomConfirmationLatLng();
//   @override
//   fromJson(json) {
//     return json;
//   }

//   @override
//   toJson(object) {
//     return object;
//   }
// }

