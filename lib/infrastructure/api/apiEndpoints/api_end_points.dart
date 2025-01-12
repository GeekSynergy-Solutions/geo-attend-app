import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIEndPoints {
  static String baseURL = dotenv.env['BASE_URL'] ?? '';

  static String geoLocationBaseURL = dotenv.env['BASE_URL'] ?? '';

  static String signUpEndPoint = '/api/auth/create-an-account';
  static String logInEndPoint = '/api/auth/login';
  static String continueAsAGuestEndPoint = '/api/auth/continue-as-a-guest';
  static String logOutEndPoint = '/api/auth/logout';
  static String verifyAccountEndPoint = '/api/auth/account-verification';
  static String verifyDeviceEndPoint = '/api/auth/device-verification';
  static String resendAccVerificationEndPoint =
      '/api/auth/request-account-verification';
  static String resendDeviceVerificationEndPoint =
      '/api/auth/request-device-verification';
  static String requestForgotPasswordEndPoint =
      '/api/auth/request-forgot-password';
  static String resendForgotPasswordReqEndPoint =
      '/api/auth/request-forgot-password';
  static String verifyForgotPasswordRequestOtpEndPoint =
      '/api/auth/forgot-password-otp-verification';
  static String resetPasswordEndPoint = '/api/auth/reset-password';
  
  static String validateAccEndPoint = '/api/users/validate-Account';
  static String refreshTokenEndPoint = '/api/users/refresh';

  static String attendanceBioDataEndPoint = '/api/attendance/attendance-bio-fields-data';
  static String attendanceGeoFenceEndPoint = '/api/attendance/attendance-geo-fence';
  static String attendanceRecurringModesEndPoint = '/api/attendance/attendance-recurring-modes';
  static String attendeeAttendanceAnalyticsEndPoint = '/api/attendance/attendee-attendance-analytics';
  static String hostAttendanceAnalyticsEndPoint = '/api/attendance/host-attendance-analytics';
  static String attendeeAttendancePieChartEndPoint = '/api/attendance/attendee-attendance-pie-chart';
  static String hostAttendancePieChartEndPoint = '/api/attendance/host-attendance-pie-chart';
  static String attendeeAttendancesEndPoint = '/api/attendance/attendee-attendances';
  static String hostAttendancesEndPoint = '/api/attendance/host-attendances';
  static String createCircularGeoFenceAttendanceEndPoint = '/api/attendance/create-attendance/circular-geo-fence';
  static String createPolygonGeoFenceAttendanceEndPoint = '/api/attendance/create-attendance/polygon-geo-fence';
  static String joinAttendanceEndPoint = '/api/attendance/join-attendance/attend';
  static String verifyAttendanceCodeEndPoint = '/api/attendance/join-attendance/verify';
  static String recentAttendeeAttendanceEndPoint = '/api/attendance/recent-attendee-attendances';
  static String recentHostAttendanceEndPoint = '/api/attendance/recent-host-attendances';
  static String sendAttendanceConfirmationCodeEndPoint = '/api/attendance/send-attendance-confirmation-code';
  static String verifyAttendanceConfirmationCodeEndPoint = '/api/attendance/verify-attendance-confirmation-code';
  static String sendAttendanceReportToHostEndPoint = '/api/attendance/send-attendance-report-to-host';
  static String totalAttendanceAttendedEndPoint = '/api/attendance/total-attendance-attended';
  static String totalAttendanceCreatedEndPoint = '/api/attendance/total-attendance-created';

  static String photoBaseUrl = baseURL;


  // geo locations
  static String hereAuthApiKey = dotenv.env['HERE_AUTH_API_KEY'] ?? '';

  static String hereAutoCompleteBaseUrl = dotenv.env['HERE_AUTO_COMPLETE_BASE_URL'] ?? '';
  static String hereGeoCodeBaseUrl = dotenv.env['HERE_GEO_CODE_BASE_URL'] ?? '';

  static String hereAutoCompleteEndPoint = '/v1/autocomplete';
  static String hereGeoCodeEndPoint = '/v1/geocode';

  static String mapTilerApiKey = dotenv.env['MAP_TILER_API_KEY'] ?? '';
}

class APIEndPointsParameter {
  static const String authHeader = 'Authorization';
  static const String noAuthHeader = 'NoAuthorization';
  static const String bearer = 'Bearer ';
}
