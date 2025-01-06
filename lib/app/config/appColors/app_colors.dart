import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF001D1C);
  static const Color secondaryColor = Color(0xFFECFCE5);

  static const Color scaffoldBgColor = Color(0xFFFDFFF2);

  static const Color appBar = Color(0xFF001D1C);
  static const Color buttonColor = Color(0xFF00544F);
  static const Color primaryButtonColor = Color(0xFF00544F);
  static const Color buttonBorderPrimaryColor = Color(0xFF00544F);
  static const Color buttonWhiteBgColor = Color(0xFFFFFFFF);
  static const Color activeSwitchColor = Color(0xFF001D1C);
  static const Color appTitleColor = Color(0xFF001D1C);

  static const Color welcomeGreetingTitleColor = Color(0xFF404446);
  static const Color welcomeGreetingDescColor = Color(0xFF6C7072);

  static const Color upcomingAttendanceBgColor = Color(0xFF001D1C);
  static const Color upcomingAttendanceSeeDetailsTextColor = Color(0xFFFDFFF2);

  static const Color loginCircularBgColor = Color(0xFFF7F9FA);

  static const Color passwordIndicatorBorderColor = Color(0xFF001D1C);
  static const Color passwordIndicatorFillColor = Color(0xFF001D1C);

  static const Color iconPrimaryColor = Color(0xFF00544F);
  static const Color iconWhiteColor = Color(0xFFFFFFFF);

  static const Color locationMarkerColor = Color(0xFF00544F);

  static const Color geoMapTileColor = Color(0xFF00544F);

  static const Color iconSearchColor = Color(0xFF001D1C);

  static const Color snackBarSuccessBackgroundColor = Color(0xFF4CAF50);
  static const Color snackBarFailureBackgroundColor = Color(0xFFF44336);

  static const Color onBoardingFeatureTitleTextColor = Color(0xFF001D1C);
  static const Color onBoardingFeatureDescTextColor = Color(0xFF72777A);
  static const Color onBoardingSkipOrBackTextColor = Color(0xFF72777A);
  static const Color onBoardingActiveIndicatorColor = Color(0xFF00544F);
  static const Color onBoardingInActiveIndicatorColor = Color(0xFFD9E5E5);
  static const Color onBoardingGetStartedTextColor = Color(0xFFFDFFF2);
  static const Color onBoardingNextBtnBgColor = Color(0xFF00544F);
  static const Color onBoardingNextIconColor = Color(0xFFFDFFF2);

  static const Color textColor = Color(0xFF72777A);
  static const Color textLighterColor = Color(0xFF72777A);
  static const Color textDarkerColor = Color(0xFF202325);
  static const Color textFieldLabelColor = Color(0xFF202325);
  static const Color blackBgColor = Color(0xFF000000);
  static const Color blackBorderColor = Color(0xFF000000);
  static const Color blackTextColor = Color(0xFF000000);
  static const Color whiteBgColor = Color(0xFFFFFFFF);
  static const Color whiteBorderColor = Color(0xFFFFFFFF);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color buttonWhiteTextColor = Color(0xFFFFFFFF);
  static const Color primaryTextColor = Color(0xFF001D1C);

  static const Color bottomSheetBgColor = Color(0xFFFDFFF2);

  static const Color backButtonBgColor = Color(0xFFF2F4F5);

  static const Color calendarIconColor = Color(0xFFCDCFD0);

  static const Color arrowDownIconColor = Color(0xFF001D1C);

  static const Color copyIconColor = Color(0xFF001D1C);
  static const Color attndCodeCopyBgColor = Color(0xFFFFFFFF);

  static const Color cursorColor = Color(0xFF001D1C);
  static const Color otpCursorColor = Color(0xFF001D1C);

  static const Color selectedBottomNavItemColor = Color(0xFF001D1C);
  static const Color unselectedBottomNavItemColor = Color(0xFFCDCFD0);
  static const Color bottomNavBgColor = Color(0xFFFDFFF2);
  
  static const Color overlayColor = Color(0xFFFFFFFF);
  static const Color preLoaderValueColor = Color(0xFFFFFFFF);
  static const Color preLoaderBgColor = Color(0xFF001D1C);

  static const Color otpActiveTextFieldColor = Color(0xFF202325);
  static const Color otpInActiveTextFieldColor = Color(0xFF72777A);
  static const Color otpTextFieldFilledColor = Color(0xFFFFFFFF);

  static const Color formHintColor = Color(0xFFCDCFD0);
  static const Color formTextColor = Color(0xFF001D1C);
  static const Color textFieldBorderColor = Color(0xFFCDCFD0);

  static const Color termsAgreementBoxBorderColor = Color(0xFFCDCFD0);
  static const Color termsAgreementBoxCheckedColor = Color(0xFF001D1C);

  static const Color attdDetailsCheckColor = Color(0xFFFFFFFF);
  static const Color attdDetailsCheckedBorderFillColor = Color(0xFF001D1C);

  static const Color redColor = Color(0xFFF44336);
  static const Color greenColor = Color(0xFF4CAF50);

  static const Color inActiveButtonBgColor = Color(0xFFB0CAC8);
  static const Color activeButtonBgColor = Color(0xFF00544F);
  static const Color inActiveSliderColor = Color(0xFFB0CAC8);
  static const Color activeSliderColor = Color(0xFF00544F);

  static const Color enterCodeColor = Color(0xFF00544F);
  static const Color resendColor = Color(0xFF00544F);

  static const Color homeActionItemBgColor = Color(0xFFF2F4F5);

  static const Color homeGuestUserInfoBorderColor = Color(0xFFCDCFD0);

  static const Color homeUserProfileNameColor = Color(0xFF404446);
  static const Color homeUserProfileDesColor = Color(0xFF404446);

  static const Color joinWithCodeBgColor = Color(0xFFE6EEED);
  static const Color createAttendanceBgColor = Color(0xFF00544F);

  static const Color attendanceFormDividerColor = Color(0xFFCDCFD0);

  static const Color createAttendanceHeaderColor = Color(0xFF090A0A);

  static Color darkenColor(Color color, [double amount = 0.1]) =>
      Color.fromARGB(
        color.alpha,
        (color.red * (1 - amount)).toInt(),
        (color.green * (1 - amount)).toInt(),
        (color.blue * (1 - amount)).toInt(),
      );
}
