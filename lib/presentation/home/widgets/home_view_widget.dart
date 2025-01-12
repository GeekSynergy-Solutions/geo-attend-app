import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/domain/entity/response/auth/verifiedUserData/verified_user_data_response.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/home/bloc/event/home_event.dart';
import 'package:geoattend/presentation/home/bloc/home_bloc.dart';
import 'package:geoattend/presentation/home/bloc/state/home_state.dart';
import 'package:geoattend/presentation/home/widgets/home_brief_info_widget.dart';
import 'package:geoattend/presentation/home/widgets/home_user_profile_widget.dart';
import 'package:geoattend/presentation/home/widgets/host_attendee_session_widget.dart';
import 'package:geoattend/presentation/home/widgets/previous_attendance_widget.dart';
import 'package:geoattend/presentation/home/widgets/total_attendance_created_joined_widget.dart';

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

  bool switchToHost = true;

  @override
  void initState() {
    successfulUserDataStatus = widget.successfulUserDataStatus;
    verifiedUserData = successfulUserDataStatus.verifiedUserDataResponse;
    BlocProvider.of<HomeBloc>(context).add(
      GetTotalAttendanceHomeEvent(
        actAsBgRequest: false,
        asHost: switchToHost,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is SessionSwitchState) {
          setState(() {
            switchToHost = state.toAHost;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpacerWidget(
            height: 40.0,
          ),
          HomeUserProfileWidget(
            greeting: verifiedUserData.firstTimeUser
                ? AppStringConstants.firstTimeWelcomeGreeting
                : AppStringConstants.welcomeGreeting,
            userBgColor: verifiedUserData.profileBgColor!,
            userFirstName: verifiedUserData.firstName,
            userInitial: verifiedUserData.userInitial,
          ),
          if (successfulUserDataStatus.isUserAGuest)
            const AppSpacerWidget(
              height: 20.0,
            ),
          // if (successfulUserDataStatus.isUserAGuest) const HomeGuestInfoWidget(),
          Expanded(
            child: SingleChildScrollView(
              child: RefreshIndicator.adaptive(
                onRefresh: () async {},
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeBriefInfoWidget(
                      userFirstTimeLogin: verifiedUserData.firstTimeUser,
                    ),
                    const AppSpacerWidget(
                      height: 20.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HostAttendeeSessionWidget(),
                          TotalAttendanceCreatedJoinedWidget(),
                          PreviousAttendanceWidget(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
