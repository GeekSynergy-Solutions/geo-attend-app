import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_confirmed_for_attendee_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_created_successfully_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_details_for_attendee_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_details_summary_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_end_for_attendee_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_history_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_report_sent_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendance_session_ended_page.dart';
import 'package:geoattend/presentation/attendance/pages/attendee_checked_in_page.dart';
import 'package:geoattend/presentation/attendance/pages/create_attendance_page.dart';
import 'package:geoattend/presentation/attendance/pages/join_attendance_enter_details_page.dart';
import 'package:geoattend/presentation/attendance/pages/join_attendance_page.dart';
import 'package:geoattend/presentation/attendance/pages/set_up_attendance_geo_fence_page.dart';
import 'package:geoattend/presentation/auth/pages/account_verification_page.dart';
import 'package:geoattend/presentation/auth/pages/device_verification_page.dart';
import 'package:geoattend/presentation/auth/pages/forgot_password_auth_code_page.dart';
import 'package:geoattend/presentation/auth/pages/login_page.dart';
import 'package:geoattend/presentation/auth/pages/login_password_page.dart';
import 'package:geoattend/presentation/auth/pages/mail_sent_after_requesting_for_forgot_password_page.dart';
import 'package:geoattend/presentation/auth/pages/request_forgot_password_page.dart';
import 'package:geoattend/presentation/auth/pages/reset_password_page.dart';
import 'package:geoattend/presentation/auth/pages/sign_up_page.dart';
import 'package:geoattend/presentation/auth/pages/welcome_back_page.dart';
import 'package:geoattend/presentation/dashboard/pages/dashboard_page.dart';
import 'package:geoattend/presentation/home/pages/home_page.dart';
import 'package:geoattend/presentation/onBoarding/pages/get_started_page.dart';
import 'package:geoattend/presentation/onBoarding/pages/on_boarding_page.dart';
import 'package:geoattend/presentation/reports/pages/report_page.dart';
import 'package:geoattend/presentation/settings/pages/profile_page.dart';
import 'package:geoattend/presentation/splash/pages/splash_page.dart';
import 'package:geoattend/presentation/testing_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: OnBoardingRoute.page,
        ),
        AutoRoute(
          page: GetStartedRoute.page,
        ),
        AutoRoute(
          page: WelcomeBackRoute.page,
        ),
        AutoRoute(
          page: LoginRoute.page,
        ),
        AutoRoute(
          page: LoginPasswordRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: AccountVerificationRoute.page,
        ),
        AutoRoute(
          page: DeviceVerificationRoute.page,
        ),
        AutoRoute(
          page: RequestForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: MailSentAfterRequestingForForgotPasswordRoute.page,
        ),
        AutoRoute(
          page: ForgotPasswordAuthCodeRoute.page,
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
        ),
        AutoRoute(
          page: DashboardRoute.page,
          children: [
            AutoRoute(
              page: HomeRoute.page,
            ),
            AutoRoute(
              page: AttendanceHistoryRoute.page,
            ),
            AutoRoute(
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: CreateAttendanceRoute.page,
        ),
        AutoRoute(
          page: SetUpAttendanceGeoFenceRoute.page,
        ),
        AutoRoute(
          page: AttendanceDetailsSummaryRoute.page,
        ),
        AutoRoute(
          page: AttendanceCreatedSuccessfullyRoute.page,
        ),
        AutoRoute(
          page: AttendanceSessionEndedRoute.page,
        ),
        AutoRoute(
          page: AttendanceReportSentRoute.page,
        ),
        AutoRoute(
          page: JoinAttendanceRoute.page,
        ),
        AutoRoute(
          page: JoinAttendanceEnterDetailsRoute.page,
        ),
        AutoRoute(
          page: AttendanceDetailsForAttendeeRoute.page,
        ),
        AutoRoute(
          page: AttendeeCheckedInRoute.page,
        ),
        AutoRoute(
          page: AttendanceEndForAttendeeRoute.page,
        ),
        AutoRoute(
          page: AttendanceConfirmedForAttendeeRoute.page,
        ),
        AutoRoute(
          page: TestingRoute.page,
        ),
      ];
}
