import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';

class CreateJoinAttendanceWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  const CreateJoinAttendanceWidget({super.key, required this.successfulUserDataStatus,});

  @override
  State<CreateJoinAttendanceWidget> createState() => _CreateJoinAttendanceWidgetState();
}

class _CreateJoinAttendanceWidgetState extends State<CreateJoinAttendanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppButtonWidget(
          appButtonFunctionality: () {
            context.router.push(
              CreateAttendanceRoute(
                successfulUserDataStatus: widget.successfulUserDataStatus,
              ),
            );
          },
          decoration: BoxDecoration(
            color: AppColors.createAttendanceBgColor,
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          height: 40,
          width: 150,
          child: Center(
            child: Text(
              AppStringConstants.createAttendanceBtnLabel,
              style: const TextStyle(
                color: AppColors.buttonWhiteTextColor,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.topEnd,
            child: AppButtonWidget(
              appButtonFunctionality: () {},
              decoration: BoxDecoration(
                color: AppColors.joinWithCodeBgColor,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              height: 40,
              width: 150,
              child: Center(
                child: Text(
                  AppStringConstants.joinWithCodeBtnLabel,
                  style: const TextStyle(
                    color: AppColors.primaryTextColor,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
