import 'package:equatable/equatable.dart';

class HereAddressResponse extends Equatable {
  final String label;
  final String? countryCode;
  final String? countryName;
  final String? stateCode;
  final String? state;
  final String? county;
  final String? city;
  final String? district;
  final String? street;
  final String? postalCode;
  final String? houseNumber;

  const HereAddressResponse({
    required this.label,
    this.countryCode = '',
    this.countryName = '',
    this.stateCode = '',
    this.state = '',
    this.county = '',
    this.city = '',
    this.district = '',
    this.street = '',
    this.postalCode = '',
    this.houseNumber = '',
  });

  @override
  List<Object?> get props => [
        label,
        countryCode,
        countryName,
        stateCode,
        state,
        county,
        city,
        district,
        street,
        postalCode,
        houseNumber,
      ];
}
