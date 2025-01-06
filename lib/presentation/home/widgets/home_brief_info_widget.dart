import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/objectData/upcomingAttendance/upcoming_attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/welcomeGreeting/welcome_greeting_data.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class HomeBriefInfoWidget extends StatefulWidget {
  final bool userFirstTimeLogin;
  const HomeBriefInfoWidget({
    super.key,
    required this.userFirstTimeLogin,
  });

  @override
  State<HomeBriefInfoWidget> createState() => _HomeBriefInfoWidgetState();
}

class _HomeBriefInfoWidgetState extends State<HomeBriefInfoWidget>
    with SingleTickerProviderStateMixin {
  late bool userFirstTimeLogin;
  bool doUserHaveUpcomingAttendance = false;

  List<WelcomeGreetingData> welcomeGreetings = [
    WelcomeGreetingData(
      description:
          'GeoAttend - your attendance-taking buddy, that simplifies and ensures accurate attendance tracking for physical meetings.',
      title: 'Welcome to GeoAttend',
      imagePath: AppImagePath.firstWelcomePopUpSvg,
    ),
    WelcomeGreetingData(
      description:
          'Easily switch between creating a meeting as a host or Joining one as a guest.',
      title: 'Host or Join: Switch with Ease',
      imagePath: AppImagePath.secondWelcomePopUpSvg,
    ),
  ];

  UpcomingAttendanceData? upcomingAttendanceData;

  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    userFirstTimeLogin = widget.userFirstTimeLogin;

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userFirstTimeLogin && !doUserHaveUpcomingAttendance
        ? PageView.builder(
            itemCount: welcomeGreetings.length,
            itemBuilder: (context, index) {
              WelcomeGreetingData welcomeGreeting = welcomeGreetings[index];
              return SlideTransition(
                position: _animation,
                child: firstTimeGreetingItem(
                  description: welcomeGreeting.description,
                  imagePath: welcomeGreeting.imagePath,
                  title: welcomeGreeting.title,
                ),
              );
            },
          )
        : doUserHaveUpcomingAttendance && upcomingAttendanceData != null
            ? upcomingAttendance(
                upcomingAttendanceData: upcomingAttendanceData!,
              )
            : Container();
  }

  Widget firstTimeGreetingItem({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Container(
      height: 190,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.whiteBorderColor,
        ),
        color: AppColors.whiteBgColor,
      ),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: AppColors.welcomeGreetingTitleColor,
                  ),
                ),
                const AppSpacerWidget(
                  height: 10.0,
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: AppColors.welcomeGreetingDescColor,
                  ),
                ),
              ],
            ),
            const AppSpacerWidget(
              width: 20.0,
            ),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: SvgPicture.asset(
                  AppImagePath.locationTrackingSvg,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget upcomingAttendance(
      {required UpcomingAttendanceData upcomingAttendanceData}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Upcoming meetings',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
            color: AppColors.welcomeGreetingTitleColor,
          ),
        ),
        const AppSpacerWidget(
          height: 20.0,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.upcomingAttendanceBgColor,
          ),
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                SvgPicture.asset(AppImagePath.upcomingAttendanceSvg),
                const AppSpacerWidget(
                  width: 20.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        upcomingAttendanceData.attendanceTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                      const AppSpacerWidget(
                        height: 10.0,
                      ),
                      iconDescForUpcomingAttendance(
                        description: upcomingAttendanceData.attendanceVenue,
                        icon: Icons.location_on,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          iconDescForUpcomingAttendance(
                            description: upcomingAttendanceData.attendanceDate,
                            icon: Icons.calendar_month,
                          ),
                          iconDescForUpcomingAttendance(
                            description: upcomingAttendanceData.attendanceTime,
                            icon: Icons.timer,
                          ),
                        ],
                      ),
                      Text(
                        'Radius set at ${upcomingAttendanceData.attendanceRadius} around ${upcomingAttendanceData.attendanceVenue}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: AppColors.whiteTextColor,
                        ),
                      ),
                      const AppSpacerWidget(
                        height: 10.0,
                      ),
                      AppButtonWidget(
                        appButtonFunctionality: () {},
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                          border: Border.all(
                            color: AppColors.whiteBorderColor,
                          ),
                        ),
                        height: 50.0,
                        width: 150.0,
                        child: const Center(
                          child: Text(
                            'See details',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: AppColors
                                  .upcomingAttendanceSeeDetailsTextColor,
                            ),
                          ),
                        ),
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

  Widget iconDescForUpcomingAttendance(
      {required String description, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.iconWhiteColor,
          ),
          const AppSpacerWidget(
            width: 2.0,
          ),
          Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: AppColors.whiteTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
