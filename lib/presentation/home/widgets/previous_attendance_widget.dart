import 'package:avatar_stack/avatar_stack.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/objectData/analyticsInterval/analytics_interval_data.dart';
import 'package:geoattend/domain/entity/objectData/upcomingAttendance/upcoming_attendance_data.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/home/bloc/home_bloc.dart';
import 'package:geoattend/presentation/home/bloc/state/home_state.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PreviousAttendanceWidget extends StatefulWidget {
  const PreviousAttendanceWidget({
    super.key,
  });

  @override
  State<PreviousAttendanceWidget> createState() =>
      _PreviousAttendanceWidgetState();
}

class _PreviousAttendanceWidgetState extends State<PreviousAttendanceWidget> {
  bool isItAnAttendee = false;

  int numberOfAttendenace = 0;
  UpcomingAttendanceData? recentAttendance;

  List<AnalyticsIntervalData> intervals = [
    AnalyticsIntervalData(id: 1, interval: 'Today'),
    AnalyticsIntervalData(id: 2, interval: 'This Week'),
    AnalyticsIntervalData(id: 3, interval: 'This Month'),
    AnalyticsIntervalData(id: 4, interval: 'This Year'),
  ];

  late AnalyticsIntervalData selectedInterval;

  bool anyPreviousAttendance = false;

  @override
  void initState() {
    selectedInterval = intervals[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is SessionSwitchState) {
          setState(() {
            isItAnAttendee = !state.toAHost;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSpacerWidget(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                AppStringConstants.previousAttendanceLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.0,
                  color: AppColors.previousAttendanceLabelColor,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: InkWell(
                    onTap: (){},
                    child: Text(
                      AppStringConstants.seeAllLabel,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: AppColors.previousAttendanceLabelColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const AppSpacerWidget(
            height: 20.0,
          ),
          if (anyPreviousAttendance)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    numericAnalyticsWidget(
                      numberOfAttendenace: numberOfAttendenace,
                    ),
                    if (recentAttendance != null)
                      recentAttendanceWidget(
                        recentAttendance: recentAttendance!,
                      ),
                  ],
                ),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: joinOrCreateAttendanceBtnWidget(),
                ),
              ],
            ),
          if (!anyPreviousAttendance)
            SizedBox(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    5.0,
                  ),
                ),
                color: AppColors.whiteBgColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 30.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStringConstants
                            .noPreviousAttendanceAttendanceDesLabel(
                          isItAnAttendee: isItAnAttendee,
                        ),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          color: AppColors.blackTextColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const AppSpacerWidget(
                        height: 20.0,
                      ),
                      SvgPicture.asset(AppImagePath.sadReactionSvg),
                      const AppSpacerWidget(
                        height: 20.0,
                      ),
                      joinOrCreateAttendanceBtnWidget()
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  AppButtonWidget joinOrCreateAttendanceBtnWidget() {
    return AppButtonWidget(
      appButtonFunctionality: () {},
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30.0,
        ),
        color: AppColors.primaryButtonColor,
      ),
      height: 50.0,
      width: 200.0,
      child: Center(
        child: Text(
          isItAnAttendee ? 'Join An Attendance' : 'Create An Attendance',
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14.0,
            color: AppColors.buttonWhiteTextColor,
          ),
        ),
      ),
    );
  }

  Widget numericAnalyticsWidget({required int numberOfAttendenace}) {
    return SizedBox(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
        color: AppColors.whiteBgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 5.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    ...List.generate(
                      intervals.length,
                      (index) {
                        AnalyticsIntervalData analyticsInterval =
                            intervals[index];
                        return PopupMenuItem(
                          onTap: () {
                            setState(() {
                              selectedInterval = analyticsInterval;
                            });
                          },
                          child: Text(
                            analyticsInterval.interval,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.0,
                              color: AppColors.analyticsLabelColor,
                            ),
                          ),
                        );
                      },
                    ),
                  ];
                },
                child: Container(
                  width: 120.0,
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        selectedInterval.interval,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          color: AppColors.analyticsLabelColor,
                        ),
                      ),
                      const AppSpacerWidget(
                        width: 5.0,
                      ),
                      const Icon(Icons.keyboard_arrow_down,
                          color: AppColors.iconPrimaryColor),
                    ],
                  ),
                ),
              ),
              const AppSpacerWidget(
                height: 5.0,
              ),
              Text(
                'Total no of meetings ${isItAnAttendee ? 'joined' : 'hosted'}',
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.0,
                  color: AppColors.textLighterColor,
                ),
              ),
              const AppSpacerWidget(
                height: 10.0,
              ),
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: CircularPercentIndicator(
                  radius: 120.0,
                  lineWidth: 13.0,
                  animation: true,
                  percent: 0.7,
                  center: Text(
                    '$numberOfAttendenace',
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 34.0,
                      color: AppColors.blackTextColor,
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  backgroundColor: AppColors.whiteBgColor,
                  progressColor: AppColors.attendanceProgressBgColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget recentAttendanceWidget(
      {required UpcomingAttendanceData recentAttendance}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          5.0,
        ),
      ),
      color: AppColors.whiteBgColor,
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              recentAttendance.attendanceTitle,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
                color: AppColors.blackTextColor,
              ),
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            iconDescForRecentAttendance(
              description: recentAttendance.attendanceLocation,
              icon: Icons.location_on_outlined,
            ),
            iconDescForRecentAttendance(
              description: recentAttendance.attendanceDate,
              icon: Icons.location_on_outlined,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                children: [
                  AvatarStack(
                    height: 50,
                    avatars: [
                      for (var i = 0; i < 3; i++)
                        CachedNetworkImageProvider(
                            recentAttendance.attendedUsers[i]),
                    ],
                  ),
                  if ((recentAttendance.attendedUsers.length - 3) > 0)
                    const AppSpacerWidget(
                      width: 5.0,
                    ),
                  if ((recentAttendance.attendedUsers.length - 3) > 0)
                    Text(
                      '+ ${recentAttendance.attendedUsers.length - 3} ${(recentAttendance.attendedUsers.length - 3) > 1 ? 'attendees' : 'attendee'}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                        color: AppColors.noOfAttendeesColor,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconDescForRecentAttendance(
      {required String description, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.iconPrimaryColor,
          ),
          const AppSpacerWidget(
            width: 2.0,
          ),
          Text(
            description,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
              color: AppColors.textLighterColor,
            ),
          ),
        ],
      ),
    );
  }
}
