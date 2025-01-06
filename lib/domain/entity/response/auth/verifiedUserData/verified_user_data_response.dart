// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class VerifiedUserDataResponse extends Equatable {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String emailAddress;
  String firstName;
  final String lastName;
  final String deviceName;
  final String profileBgColor;
  final String userInitial;
  final bool accountVerified;
  final bool deviceVerified;
  final bool firstTimeLogin;
  final bool hasUserMigrated;
  Color? userProfileBgColor;
  String? tokenExpiryDate;
  String? role;

  VerifiedUserDataResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.emailAddress,
    required this.userId,
    required this.profileBgColor,
    required this.firstName,
    required this.lastName,
    required this.deviceName,
    required this.accountVerified,
    required this.deviceVerified,
    required this.firstTimeLogin,
    required this.hasUserMigrated,
    required this.userInitial,
    this.userProfileBgColor,
    this.tokenExpiryDate = '',
    this.role = '',
  }) {
    firstName = firstName.isEmpty ? deviceName : firstName;
    role = hasUserMigrated ? 'User' : 'Guest';
    userProfileBgColor = Color(int.parse(profileBgColor));
    tokenExpiryDate = tokenExpiryDate!.isEmpty
        ? DateTime.now()
            .add(const Duration(
              hours: 3,
            ))
            .toIso8601String()
        : tokenExpiryDate;
  }

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
        emailAddress,
        userId,
        profileBgColor,
        firstName,
        lastName,
        deviceName,
        accountVerified,
        deviceVerified,
        firstTimeLogin,
        hasUserMigrated,
        userInitial,
        tokenExpiryDate,
        userProfileBgColor
      ];
}
