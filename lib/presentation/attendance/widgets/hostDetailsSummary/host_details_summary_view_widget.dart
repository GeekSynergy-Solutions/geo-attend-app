import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';
import 'package:geoattend/presentation/attendance/widgets/hostDetailsSummary/host_details_summary_des_widget.dart';
import 'package:geoattend/presentation/attendance/widgets/hostDetailsSummary/host_details_summary_details_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class HostDetailsSummaryViewWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  final AttendanceData attendanceData;
  const HostDetailsSummaryViewWidget({
    super.key,
    required this.successfulUserDataStatus,
    required this.attendanceData,
  });

  @override
  State<HostDetailsSummaryViewWidget> createState() =>
      _HostDetailsSummaryViewWidgetState();
}

class _HostDetailsSummaryViewWidgetState
    extends State<HostDetailsSummaryViewWidget> {
  late SuccessfulUserDataStatus successfulUserDataStatus;
  late AttendanceData attendanceData;

  @override
  void initState() {
    successfulUserDataStatus = widget.successfulUserDataStatus;
    attendanceData = widget.attendanceData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is CreateHostAttendanceState) {
            if (state.requestInProgress) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }

            GeneralFunctions.handleUnauthorizedRouting(
              isRequestUnAuthorized: state.isRequestUnAuthorized,
              context: context,
            );

            if (state.success) {
              context.router.push(
                AttendanceCreatedSuccessfullyRoute(
                  successfulUserDataStatus: successfulUserDataStatus,
                  attendanceData: attendanceData,
                ),
              );
            } else {
              if (state.errorMessage != null) {
                GeneralFunctions.snackBarMessage(
                    context: context, message: state.errorMessage!);
              }
            }
          }

          if (state is UpdateAttendanceDataState) {
            if (state.updateAttendanceData) {
              setState(() {
                attendanceData = state.updatedAttendanceData;
              });
            }
          }
        },
        child: NetworkRequestLoadingOverlayWidget(
          child: AppBodyPaddingWidget(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppBackButtonWidget(),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                HostDetailsSummaryDesWidget(
                  attendanceDesc: attendanceData.attendanceDesc,
                  attendanceName: attendanceData.attendanceName,
                ),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                HostDetailsSummaryDetailsWidget(
                  attendanceData: attendanceData,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
