import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/domain/entity/response/auth/verifiedUserData/verified_user_data_response.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/home/widgets/create_join_attendance_widget.dart';
import 'package:geoattend/presentation/home/widgets/home_brief_info_widget.dart';
import 'package:geoattend/presentation/home/widgets/home_user_profile_widget.dart';

class HomeViewWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  const HomeViewWidget({
    super.key,
    required this.successfulUserDataStatus,
  });

  @override
  State<HomeViewWidget> createState() => _HomeViewWidgetState();
}

class _HomeViewWidgetState extends State<HomeViewWidget> {
  late SuccessfulUserDataStatus successfulUserDataStatus;
  late VerifiedUserDataResponse verifiedUserData;

  @override
  void initState() {
    successfulUserDataStatus = widget.successfulUserDataStatus;
    verifiedUserData = successfulUserDataStatus.verifiedUserDataResponse;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSpacerWidget(
          height: 45.0,
        ),
        HomeUserProfileWidget(
          greeting: verifiedUserData.firstTimeLogin
              ? AppStringConstants.firstTimeWelcomeGreeting
              : AppStringConstants.welcomeGreeting,
          userBgColor: verifiedUserData.userProfileBgColor!,
          userFirstName: verifiedUserData.firstName,
          userInitial: verifiedUserData.userInitial,
        ),
        if (successfulUserDataStatus.isUserAGuest)
          const AppSpacerWidget(
            height: 25.0,
          ),
        // if (successfulUserDataStatus.isUserAGuest) const HomeGuestInfoWidget(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeBriefInfoWidget(
                  userFirstTimeLogin: verifiedUserData.firstTimeLogin,
                ),
                const AppSpacerWidget(
                  height: 25.0,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CreateJoinAttendanceWidget(
                        successfulUserDataStatus: successfulUserDataStatus,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
