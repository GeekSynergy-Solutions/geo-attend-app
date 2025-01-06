import 'package:geoattend/domain/entity/response/auth/accountVerification/account_verification_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_verification_model.g.dart';

@JsonSerializable()
class AccountVerificationModel extends AccountVerificationResponse {
  const AccountVerificationModel({
    required super.verificationStatus,
  });

  factory AccountVerificationModel.fromJson(Map<String, dynamic> json) {
    return _$AccountVerificationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AccountVerificationModelToJson(this);
  }
}
