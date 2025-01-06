// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:geoattend/domain/entity/response/auth/verifiedUserData/verified_user_data_response.dart';

class SuccessfulUserDataStatus extends Equatable{
  bool isUserAGuest;
  VerifiedUserDataResponse verifiedUserDataResponse;
  SuccessfulUserDataStatus({
    this.isUserAGuest = true,
    required this.verifiedUserDataResponse,
  });
  SuccessfulUserDataStatus.verifiedUser({
    this.isUserAGuest = false,
    required this.verifiedUserDataResponse,
  });
  
  @override
  List<Object?> get props => [
    isUserAGuest,
    verifiedUserDataResponse,
  ];
}