class AppStringConstants {
  static String getStartedLabel = 'Get Started';
  static String getStartedTitle = 'Welcome to Geoattend!';
  static String getStartedDetails =
      'Sign up to access personalized features and track your attendance seamlessly or explore the app without an account. You can still create one later !';
  static String letStartedSignUpLabel = 'Let’s get started 🎉';
  static String signUpDes = 'Create an account to continue with GeoAttend';
  static String createAnAccount = 'Create an Account';
  static String continueAsGuest = 'Continue as Guest';
  static String enterCode = 'Enter the Code';
  static String openEmailApp = 'Open Email App';
  static String alreadyHaveAnAccount = 'Already have an account?';
  static String firstTimeWelcomeGreeting = 'It’s a good day to smile 😊';
  static String welcomeGreeting = 'We’ve missed you while you were away';
  static String login = 'Login';
  static String welcomeBackLabel = 'Welcome back!';
  static String welcomeBackDes = 'Enter the email address you used to sign up';
  static String enterAccountVerificationCodeLabel =
      'Enter Account Verification Code';
  static String enterDeviceVerificationCodeLabel =
      'Enter Device Verification Code';
  static String enterAuthCodeLabel = 'Enter Authentication Code';
  static String enterAuthCodeDes(
          {String emailAddress = 'maryjohnson@gmail.com'}) =>
      'Enter the 4-digit that we have sent via the email $emailAddress and create a new password';
  static String accountDeviceVerifyAuthCodeDes(
          {String emailAddress = 'maryjohnson@gmail.com',
          bool forAccountVerification = true}) =>
      'Enter the 4-digit that we have sent via the email $emailAddress to verify your ${forAccountVerification ? 'account' : 'device'}';
  static String requestForgotPasswordLabel = 'Forgot Password?';
  static String requestForgotPasswordDes =
      'Enter the email address you signed up with and we’ll send you a code to help reset your password.';
  static String resetForgotPasswordLabel = 'Reset Password';
  static String resetForgotPasswordDes = '';
  static String mailSentLabel =
      'We’ve sent you an Email to reset your\npassword';
  static String mailSentDes = 'Go to your email to open the link';
  static String emailLabel = 'Email';
  static String passwordLabel = 'Password';
  static String newPasswordLabel = 'New Password';
  static String firstNameLabel = 'Firstname';
  static String lastNameLabel = 'Lastname';
  static String retypePasswordLabel = 'Re-enter Password';
  static String emailHint = 'e.g maryjohnson@gmail.com';
  static String passwordHint = '********';
  static String retypePasswordHint = '********';
  static String firstNameHint = 'Firstname';
  static String lastNameHint = 'Lastname';
  static String confirmPasswordHint = '********';
  static String emailFieldEmptyError = 'Enter your email address';
  static String emailFieldError = 'Please enter a valid email address';
  static String loginPassFieldError = 'Password is required';
  static String passwordFieldError =
      'Minimum of ten characters required: \nOne uppercase letter, \nOne lowercase letter, \nOne number, \nOne Special character';
  static String firstNameFieldError = 'Enter your firstname';
  static String lastNameFieldError = 'Enter your lastname';
  static String passwordMisMatchError = 'Password mismatched';
  static String confirmPasswordError = 'Confirm password required';
  static String passwordFieldErrorAfterProcess = 'Password is incorrect';
  static String nextLabel = 'Next';
  static String sendCodeLabel = 'Send Code';
  static String backToHomeLabel = 'Back to Home';
  static String sendReportLabel = 'Send Report';
  static String cancelLabel = 'Cancel';
  static String createDesLabel({required String desc}) => 'Create $desc';
  static String setRadiusLabel({String type = ''}) =>
      type.isEmpty ? 'Set Radius' : 'Set $type Radius';
  static String attndShareCodeLabel = 'Share Code';
  static String continueLabel = 'Continue';
  static String saveLabel = 'Save';
  static String enterPasswordLabel = 'Enter Password';
  static String loginLabel = 'Welcome back!';
  static String loginDesLabel =
      'Let’s pick up where you left off—log in to get started.';
  static String enterPasswordDes = 'Enter the password for your account';
  static String forgotYourPassword = 'Forgot your password?';
  static String reset = 'Reset';
  static String resend = 'Resend';
  static String resendCode = 'Resend Code';
  static String createFreeAccount = 'Create a Free Account';
  static String iAgreeTo = 'I agree to the';
  static String termsAndConditions = 'Terms of Condition';
  static String and = 'and';
  static String or = 'Or';
  static String privacyPolicy = 'Privacy\nPolicy';
  static String homeTab = 'Home';
  static String attendanceTab = 'Attendance History';
  static String reportTab = 'Report';
  static String profileTab = 'Profile';
  static String createAttendanceLabel = 'Create Attendance';
  static String attendanceDetailsLabel = 'Meeting Details';
  static String attendanceDetailsDesc =
      'Provide the necessary information to create attendance';
  static String geoFenceSetRadiusLabel({String type = ''}) =>
      type.isEmpty ? 'Set Radius' : 'Set $type Radius';
  static String geoFenceSetRadiusDes =
      'Set the allowable distance from the meeting point for attendee check in.';
  static String shareAttndCodeLabel =
      'Set the allowable distance from the meeting point for attendee check in.';
  static String shareAttndCodeDes =
      'A meeting code has been created for your meeting. Copy this code and send it to the attendee(s)';
  static String setUpGeoFenceLabel = 'Set up Geofence';
  static String setUpGeoFenceDesc =
      'Choose a Geofenced area where attendees need to be present.';
  static String setUpGeoFenceAllowableDistDesc =
      'Set the allowable distance from the meeting point for attendee check-in.';
  static String setUpGeoUseCurrentLocLabel = 'Use your current location';
  static String attendanceNameFieldEmptyError = 'Enter your attendance name';
  static String attendanceDateFieldEmptyError = 'Enter attendance date';
  static String attendanceStartTimeFieldEmptyError = 'Start time required';
  static String attendanceEndTimeFieldEmptyError = 'End time required';
  static String attendanceDescFieldEmptyError = 'Enter attendance description';
  static String attendanceTimeZoneFieldEmptyError = 'Enter attendance timezone';
  static String attendanceRecurringFieldEmptyError =
      'Enter attendance recurring mode';
  static String attendanceNameLabel = 'Attendance Name';
  static String setUpGeoFenceLocationAddressLabel = 'Location Address';
  static String attendanceDateLabel = 'Attendance Date';
  static String attendanceStartTimeLabel = 'Start Time';
  static String attendanceEndTimeLabel = 'End Time';
  static String attendanceDescLabel = 'Attendance Description';
  static String attendanceTimeZoneLabel = 'Time zone';
  static String attendanceRecurringLabel = 'Recurring Attendance';
  static String attendanceNameHint = 'e.g Mary Johnson';
  static String setUpGeoFenceAddressHint = 'e.g Mary Johnson';
  static String attendanceDateHint = 'e.g 10th Oct 2024';
  static String attendanceStartTimeHint = '';
  static String attendanceEndTimeHint = '';
  static String attendanceDescHint = '';
  static String createAttendanceBtnLabel = 'Create Attendance';
  static String joinWithCodeBtnLabel = 'Join with a Code';
  static String attendeeLabel = 'Attendee';
  static String timeZoneHintLabel = 'GMT +1';
  static String timeZoneError = 'Time zone required';
  static String recuringLabel({required String period}) => 'Recuring $period';
  static String hostLabel = 'Host';
  static String dateLabel = 'Date';
  static String startTimeLabel = 'Start Time';
  static String endTimeLabel = 'End Time';
  static String meetingLocLabel = 'Meeting Address';
  static String geoFenceRadiusLabel(
          {required String distance, required String geoFenceType}) =>
      'Geofence set at a $geoFenceType radius of $distance from the meeting location';
  static String attendanceDataFieldLabel = 'Attendee Data Field';
  static String attndDataNameFieldLabel = 'Name';
  static String attndDataEmailFieldLabel = 'Email';
  static String attndDataPhoneNumberFieldLabel = 'Phone number';
  static String attndDataDepartmentFieldLabel = 'Department';
  static String successLabel = 'Success';
  static String successfullyDes({required String desc}) =>
      'Your $desc has been created successfully';
  static String endedLabel({required String desc}) => 'The $desc has ended!';
  static String sessionEndedDes =
      'Send a unique confirmation code to attendees to confirm attendance';
  static String reportSentLabel = 'Report Sent';
  static String reportSentDes =
      'Your report has been successfully sent to the provided email address';
  static String polygonLabel = 'polygon';
  static String radiusLabel = 'radius';
  static String circularLabel = 'circular';
  static String previousAttendanceLabel = 'Previous attendance';
  static String noPreviousAttendanceAttendanceDesLabel({required bool isItAnAttendee}) => 'You are yet to ${isItAnAttendee ? 'join' : 'host'} your first meeting.\nYour previous attendance taken will appear here';
  static String totalAttendance({required bool isItAnAttendee}) => 'Total Attendance ${isItAnAttendee ? 'Joined' : 'Hosted'}';
  static String seeAllLabel = 'See All';
}
