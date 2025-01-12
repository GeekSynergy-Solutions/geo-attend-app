import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/presentation/home/bloc/event/home_event.dart';
import 'package:geoattend/presentation/home/bloc/home_bloc.dart';
import 'package:geoattend/presentation/home/bloc/state/home_state.dart';

class HostAttendeeSessionWidget extends StatelessWidget {
  const HostAttendeeSessionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        bool switchToAttendee =
            (state is SessionSwitchState) ? state.toAHost : true;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppButtonWidget(
              appButtonFunctionality: () {
                BlocProvider.of<HomeBloc>(context).add(
                  SwitchSessionHomeEvent(
                    switchToHost: true,
                  ),
                );
              },
              decoration: BoxDecoration(
                  borderRadius: switchToAttendee
                      ? null
                      : BorderRadius.circular(
                          20.0,
                        ),
                  border: switchToAttendee
                      ? null
                      : Border.all(color: AppColors.primaryBorderColor)),
              height: 40,
              width: 150,
              child: Center(
                child: Text(
                  AppStringConstants.hostLabel,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            AppButtonWidget(
              appButtonFunctionality: () {
                BlocProvider.of<HomeBloc>(context).add(
                  SwitchSessionHomeEvent(
                    switchToHost: false,
                  ),
                );
              },
              decoration: BoxDecoration(
                borderRadius: switchToAttendee
                    ? BorderRadius.circular(
                        20.0,
                      )
                    : null,
                border: switchToAttendee
                    ? Border.all(color: AppColors.primaryBorderColor)
                    : null,
              ),
              height: 40,
              width: 150,
              child: Center(
                child: Text(
                  AppStringConstants.attendeeLabel,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
