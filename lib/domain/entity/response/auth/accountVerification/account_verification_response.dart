import 'package:equatable/equatable.dart';

class AccountVerificationResponse extends Equatable {
  final bool verificationStatus;

  const AccountVerificationResponse({
    required this.verificationStatus,
  });

  @override
  List<Object?> get props => [verificationStatus,];
}