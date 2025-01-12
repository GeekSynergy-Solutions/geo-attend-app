// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';

class VerifiedUserDataResponse extends Equatable {
  final String token;
  final String refreshToken;
  final String userId;
  final String email;
  String firstName;
  final String userProfileBgColor;
  final String lastName;
  final String deviceName;
  final String userInitial;
  final bool accountVerified;
  final bool deviceVerified;
  final bool firstTimeUser;
  final bool hasUserMigrated;
  String? tokenExpiryDate;
  Color? profileBgColor;
  String? role;

  VerifiedUserDataResponse({
    required this.token,
    required this.refreshToken,
    required this.email,
    required this.userId,
    required this.userProfileBgColor,
    required this.firstName,
    required this.lastName,
    required this.deviceName,
    required this.accountVerified,
    required this.deviceVerified,
    required this.firstTimeUser,
    required this.hasUserMigrated,
    required this.userInitial,
    this.profileBgColor,
    this.tokenExpiryDate = '',
    this.role = '',
  }) {
    firstName = firstName.isEmpty ? deviceName : firstName;
    role = hasUserMigrated ? 'User' : 'Guest';
    profileBgColor = userProfileBgColor.isNotEmpty
        ? GeneralFunctions.convertHexToColor(userProfileBgColor)
        : AppColors.blackBgColor;
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
        token,
        refreshToken,
        email,
        userId,
        userProfileBgColor,
        firstName,
        lastName,
        deviceName,
        accountVerified,
        deviceVerified,
        firstTimeUser,
        hasUserMigrated,
        userInitial,
        tokenExpiryDate,
        userProfileBgColor
      ];
}
