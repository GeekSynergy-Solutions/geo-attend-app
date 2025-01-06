// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AccountVerificationPage]
class AccountVerificationRoute
    extends PageRouteInfo<AccountVerificationRouteArgs> {
  AccountVerificationRoute({
    Key? key,
    required String emailAddress,
    List<PageRouteInfo>? children,
  }) : super(
          AccountVerificationRoute.name,
          args: AccountVerificationRouteArgs(
            key: key,
            emailAddress: emailAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'AccountVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AccountVerificationRouteArgs>();
      return AccountVerificationPage(
        key: args.key,
        emailAddress: args.emailAddress,
      );
    },
  );
}

class AccountVerificationRouteArgs {
  const AccountVerificationRouteArgs({
    this.key,
    required this.emailAddress,
  });

  final Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'AccountVerificationRouteArgs{key: $key, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [AttendanceConfirmedForAttendeePage]
class AttendanceConfirmedForAttendeeRoute
    extends PageRouteInfo<AttendanceConfirmedForAttendeeRouteArgs> {
  AttendanceConfirmedForAttendeeRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceConfirmedForAttendeeRoute.name,
          args: AttendanceConfirmedForAttendeeRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceConfirmedForAttendeeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceConfirmedForAttendeeRouteArgs>();
      return AttendanceConfirmedForAttendeePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendanceConfirmedForAttendeeRouteArgs {
  const AttendanceConfirmedForAttendeeRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendanceConfirmedForAttendeeRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [AttendanceCreatedSuccessfullyPage]
class AttendanceCreatedSuccessfullyRoute
    extends PageRouteInfo<AttendanceCreatedSuccessfullyRouteArgs> {
  AttendanceCreatedSuccessfullyRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    required AttendanceData attendanceData,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceCreatedSuccessfullyRoute.name,
          args: AttendanceCreatedSuccessfullyRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
            attendanceData: attendanceData,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceCreatedSuccessfullyRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceCreatedSuccessfullyRouteArgs>();
      return AttendanceCreatedSuccessfullyPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
        attendanceData: args.attendanceData,
      );
    },
  );
}

class AttendanceCreatedSuccessfullyRouteArgs {
  const AttendanceCreatedSuccessfullyRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
    required this.attendanceData,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  final AttendanceData attendanceData;

  @override
  String toString() {
    return 'AttendanceCreatedSuccessfullyRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus, attendanceData: $attendanceData}';
  }
}

/// generated route for
/// [AttendanceDetailsForAttendeePage]
class AttendanceDetailsForAttendeeRoute
    extends PageRouteInfo<AttendanceDetailsForAttendeeRouteArgs> {
  AttendanceDetailsForAttendeeRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceDetailsForAttendeeRoute.name,
          args: AttendanceDetailsForAttendeeRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceDetailsForAttendeeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceDetailsForAttendeeRouteArgs>();
      return AttendanceDetailsForAttendeePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendanceDetailsForAttendeeRouteArgs {
  const AttendanceDetailsForAttendeeRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendanceDetailsForAttendeeRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [AttendanceDetailsSummaryPage]
class AttendanceDetailsSummaryRoute
    extends PageRouteInfo<AttendanceDetailsSummaryRouteArgs> {
  AttendanceDetailsSummaryRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    required AttendanceData attendanceData,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceDetailsSummaryRoute.name,
          args: AttendanceDetailsSummaryRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
            attendanceData: attendanceData,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceDetailsSummaryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceDetailsSummaryRouteArgs>();
      return AttendanceDetailsSummaryPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
        attendanceData: args.attendanceData,
      );
    },
  );
}

class AttendanceDetailsSummaryRouteArgs {
  const AttendanceDetailsSummaryRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
    required this.attendanceData,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  final AttendanceData attendanceData;

  @override
  String toString() {
    return 'AttendanceDetailsSummaryRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus, attendanceData: $attendanceData}';
  }
}

/// generated route for
/// [AttendanceEndForAttendeePage]
class AttendanceEndForAttendeeRoute
    extends PageRouteInfo<AttendanceEndForAttendeeRouteArgs> {
  AttendanceEndForAttendeeRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceEndForAttendeeRoute.name,
          args: AttendanceEndForAttendeeRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceEndForAttendeeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceEndForAttendeeRouteArgs>();
      return AttendanceEndForAttendeePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendanceEndForAttendeeRouteArgs {
  const AttendanceEndForAttendeeRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendanceEndForAttendeeRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [AttendanceHistoryPage]
class AttendanceHistoryRoute extends PageRouteInfo<AttendanceHistoryRouteArgs> {
  AttendanceHistoryRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceHistoryRoute.name,
          args: AttendanceHistoryRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceHistoryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceHistoryRouteArgs>();
      return AttendanceHistoryPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendanceHistoryRouteArgs {
  const AttendanceHistoryRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendanceHistoryRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [AttendancePage]
class AttendanceRoute extends PageRouteInfo<AttendanceRouteArgs> {
  AttendanceRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceRoute.name,
          args: AttendanceRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceRouteArgs>();
      return AttendancePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendanceRouteArgs {
  const AttendanceRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendanceRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [AttendanceReportSentPage]
class AttendanceReportSentRoute
    extends PageRouteInfo<AttendanceReportSentRouteArgs> {
  AttendanceReportSentRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceReportSentRoute.name,
          args: AttendanceReportSentRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceReportSentRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceReportSentRouteArgs>();
      return AttendanceReportSentPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendanceReportSentRouteArgs {
  const AttendanceReportSentRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendanceReportSentRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [AttendanceSessionEndedPage]
class AttendanceSessionEndedRoute
    extends PageRouteInfo<AttendanceSessionEndedRouteArgs> {
  AttendanceSessionEndedRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendanceSessionEndedRoute.name,
          args: AttendanceSessionEndedRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendanceSessionEndedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendanceSessionEndedRouteArgs>();
      return AttendanceSessionEndedPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendanceSessionEndedRouteArgs {
  const AttendanceSessionEndedRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendanceSessionEndedRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [AttendeeCheckedInPage]
class AttendeeCheckedInRoute extends PageRouteInfo<AttendeeCheckedInRouteArgs> {
  AttendeeCheckedInRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          AttendeeCheckedInRoute.name,
          args: AttendeeCheckedInRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'AttendeeCheckedInRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AttendeeCheckedInRouteArgs>();
      return AttendeeCheckedInPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class AttendeeCheckedInRouteArgs {
  const AttendeeCheckedInRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'AttendeeCheckedInRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [CreateAttendancePage]
class CreateAttendanceRoute extends PageRouteInfo<CreateAttendanceRouteArgs> {
  CreateAttendanceRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          CreateAttendanceRoute.name,
          args: CreateAttendanceRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateAttendanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateAttendanceRouteArgs>();
      return CreateAttendancePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class CreateAttendanceRouteArgs {
  const CreateAttendanceRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'CreateAttendanceRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<DashboardRouteArgs> {
  DashboardRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          DashboardRoute.name,
          args: DashboardRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DashboardRouteArgs>();
      return DashboardPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class DashboardRouteArgs {
  const DashboardRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'DashboardRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [DeviceVerificationPage]
class DeviceVerificationRoute
    extends PageRouteInfo<DeviceVerificationRouteArgs> {
  DeviceVerificationRoute({
    Key? key,
    required String emailAddress,
    List<PageRouteInfo>? children,
  }) : super(
          DeviceVerificationRoute.name,
          args: DeviceVerificationRouteArgs(
            key: key,
            emailAddress: emailAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'DeviceVerificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<DeviceVerificationRouteArgs>();
      return DeviceVerificationPage(
        key: args.key,
        emailAddress: args.emailAddress,
      );
    },
  );
}

class DeviceVerificationRouteArgs {
  const DeviceVerificationRouteArgs({
    this.key,
    required this.emailAddress,
  });

  final Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'DeviceVerificationRouteArgs{key: $key, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [ForgotPasswordAuthCodePage]
class ForgotPasswordAuthCodeRoute
    extends PageRouteInfo<ForgotPasswordAuthCodeRouteArgs> {
  ForgotPasswordAuthCodeRoute({
    Key? key,
    required String emailAddress,
    List<PageRouteInfo>? children,
  }) : super(
          ForgotPasswordAuthCodeRoute.name,
          args: ForgotPasswordAuthCodeRouteArgs(
            key: key,
            emailAddress: emailAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordAuthCodeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgotPasswordAuthCodeRouteArgs>();
      return ForgotPasswordAuthCodePage(
        key: args.key,
        emailAddress: args.emailAddress,
      );
    },
  );
}

class ForgotPasswordAuthCodeRouteArgs {
  const ForgotPasswordAuthCodeRouteArgs({
    this.key,
    required this.emailAddress,
  });

  final Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'ForgotPasswordAuthCodeRouteArgs{key: $key, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [GetStartedPage]
class GetStartedRoute extends PageRouteInfo<void> {
  const GetStartedRoute({List<PageRouteInfo>? children})
      : super(
          GetStartedRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetStartedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GetStartedPage();
    },
  );
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRoute.name,
          args: HomeRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>();
      return HomePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [JoinAttendanceEnterDetailsPage]
class JoinAttendanceEnterDetailsRoute
    extends PageRouteInfo<JoinAttendanceEnterDetailsRouteArgs> {
  JoinAttendanceEnterDetailsRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          JoinAttendanceEnterDetailsRoute.name,
          args: JoinAttendanceEnterDetailsRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinAttendanceEnterDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JoinAttendanceEnterDetailsRouteArgs>();
      return JoinAttendanceEnterDetailsPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class JoinAttendanceEnterDetailsRouteArgs {
  const JoinAttendanceEnterDetailsRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'JoinAttendanceEnterDetailsRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [JoinAttendancePage]
class JoinAttendanceRoute extends PageRouteInfo<JoinAttendanceRouteArgs> {
  JoinAttendanceRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          JoinAttendanceRoute.name,
          args: JoinAttendanceRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'JoinAttendanceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<JoinAttendanceRouteArgs>();
      return JoinAttendancePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class JoinAttendanceRouteArgs {
  const JoinAttendanceRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'JoinAttendanceRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [LoginPasswordPage]
class LoginPasswordRoute extends PageRouteInfo<LoginPasswordRouteArgs> {
  LoginPasswordRoute({
    Key? key,
    required String emailAddress,
    List<PageRouteInfo>? children,
  }) : super(
          LoginPasswordRoute.name,
          args: LoginPasswordRouteArgs(
            key: key,
            emailAddress: emailAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginPasswordRouteArgs>();
      return LoginPasswordPage(
        key: args.key,
        emailAddress: args.emailAddress,
      );
    },
  );
}

class LoginPasswordRouteArgs {
  const LoginPasswordRouteArgs({
    this.key,
    required this.emailAddress,
  });

  final Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'LoginPasswordRouteArgs{key: $key, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [MailSentAfterRequestingForForgotPasswordPage]
class MailSentAfterRequestingForForgotPasswordRoute
    extends PageRouteInfo<MailSentAfterRequestingForForgotPasswordRouteArgs> {
  MailSentAfterRequestingForForgotPasswordRoute({
    Key? key,
    required String emailAddress,
    List<PageRouteInfo>? children,
  }) : super(
          MailSentAfterRequestingForForgotPasswordRoute.name,
          args: MailSentAfterRequestingForForgotPasswordRouteArgs(
            key: key,
            emailAddress: emailAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'MailSentAfterRequestingForForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args =
          data.argsAs<MailSentAfterRequestingForForgotPasswordRouteArgs>();
      return MailSentAfterRequestingForForgotPasswordPage(
        key: args.key,
        emailAddress: args.emailAddress,
      );
    },
  );
}

class MailSentAfterRequestingForForgotPasswordRouteArgs {
  const MailSentAfterRequestingForForgotPasswordRouteArgs({
    this.key,
    required this.emailAddress,
  });

  final Key? key;

  final String emailAddress;

  @override
  String toString() {
    return 'MailSentAfterRequestingForForgotPasswordRouteArgs{key: $key, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<void> {
  const OnBoardingRoute({List<PageRouteInfo>? children})
      : super(
          OnBoardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnBoardingPage();
    },
  );
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileRoute.name,
          args: ProfileRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileRouteArgs>();
      return ProfilePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class ProfileRouteArgs {
  const ProfileRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'ProfileRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [ReportPage]
class ReportRoute extends PageRouteInfo<ReportRouteArgs> {
  ReportRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    List<PageRouteInfo>? children,
  }) : super(
          ReportRoute.name,
          args: ReportRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
          ),
          initialChildren: children,
        );

  static const String name = 'ReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportRouteArgs>();
      return ReportPage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
      );
    },
  );
}

class ReportRouteArgs {
  const ReportRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  String toString() {
    return 'ReportRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus}';
  }
}

/// generated route for
/// [RequestForgotPasswordPage]
class RequestForgotPasswordRoute extends PageRouteInfo<void> {
  const RequestForgotPasswordRoute({List<PageRouteInfo>? children})
      : super(
          RequestForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestForgotPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RequestForgotPasswordPage();
    },
  );
}

/// generated route for
/// [ResetPasswordPage]
class ResetPasswordRoute extends PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({
    Key? key,
    required String token,
    required String emailAddress,
    List<PageRouteInfo>? children,
  }) : super(
          ResetPasswordRoute.name,
          args: ResetPasswordRouteArgs(
            key: key,
            token: token,
            emailAddress: emailAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'ResetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ResetPasswordRouteArgs>();
      return ResetPasswordPage(
        key: args.key,
        token: args.token,
        emailAddress: args.emailAddress,
      );
    },
  );
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({
    this.key,
    required this.token,
    required this.emailAddress,
  });

  final Key? key;

  final String token;

  final String emailAddress;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{key: $key, token: $token, emailAddress: $emailAddress}';
  }
}

/// generated route for
/// [SetUpAttendanceGeoFencePage]
class SetUpAttendanceGeoFenceRoute
    extends PageRouteInfo<SetUpAttendanceGeoFenceRouteArgs> {
  SetUpAttendanceGeoFenceRoute({
    Key? key,
    required SuccessfulUserDataStatus successfulUserDataStatus,
    required AttendanceData attendanceData,
    List<PageRouteInfo>? children,
  }) : super(
          SetUpAttendanceGeoFenceRoute.name,
          args: SetUpAttendanceGeoFenceRouteArgs(
            key: key,
            successfulUserDataStatus: successfulUserDataStatus,
            attendanceData: attendanceData,
          ),
          initialChildren: children,
        );

  static const String name = 'SetUpAttendanceGeoFenceRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SetUpAttendanceGeoFenceRouteArgs>();
      return SetUpAttendanceGeoFencePage(
        key: args.key,
        successfulUserDataStatus: args.successfulUserDataStatus,
        attendanceData: args.attendanceData,
      );
    },
  );
}

class SetUpAttendanceGeoFenceRouteArgs {
  const SetUpAttendanceGeoFenceRouteArgs({
    this.key,
    required this.successfulUserDataStatus,
    required this.attendanceData,
  });

  final Key? key;

  final SuccessfulUserDataStatus successfulUserDataStatus;

  final AttendanceData attendanceData;

  @override
  String toString() {
    return 'SetUpAttendanceGeoFenceRouteArgs{key: $key, successfulUserDataStatus: $successfulUserDataStatus, attendanceData: $attendanceData}';
  }
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SignUpPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [TestingPage]
class TestingRoute extends PageRouteInfo<void> {
  const TestingRoute({List<PageRouteInfo>? children})
      : super(
          TestingRoute.name,
          initialChildren: children,
        );

  static const String name = 'TestingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TestingPage();
    },
  );
}

/// generated route for
/// [WelcomeBackPage]
class WelcomeBackRoute extends PageRouteInfo<void> {
  const WelcomeBackRoute({List<PageRouteInfo>? children})
      : super(
          WelcomeBackRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeBackRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WelcomeBackPage();
    },
  );
}
