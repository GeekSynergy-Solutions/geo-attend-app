import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/home/bloc/home_bloc.dart';
import 'package:geoattend/presentation/home/bloc/state/home_state.dart';

class TotalAttendanceCreatedJoinedWidget extends StatelessWidget {
  const TotalAttendanceCreatedJoinedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      bool isItAnAttendee =
          (state is SessionSwitchState) ? !state.toAHost : false;
      int numberOfAttendances = (state is SuccessHomeState)
          ? (isItAnAttendee
                  ? state.totalAttendanceJoined!.total
                  : state.totalAttendanceCreated!.total)
              .toInt()
          : 0;
      return Padding(
        padding: const EdgeInsets.only(
          bottom: 10.0,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              5.0,
            ),
          ),
          color: AppColors.totalAttendanceBgColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStringConstants.totalAttendance(
                      isItAnAttendee: isItAnAttendee),
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: AppColors.whiteTextColor,
                  ),
                ),
                const AppSpacerWidget(
                  height: 10.0,
                ),
                Text(
                  '$numberOfAttendances',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: AppColors.whiteTextColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
