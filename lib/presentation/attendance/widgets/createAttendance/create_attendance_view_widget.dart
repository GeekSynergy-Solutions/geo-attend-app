import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_title_info_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/event/attendance_event.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';
import 'package:geoattend/presentation/attendance/widgets/createAttendance/create_attendance_des_widget.dart';
import 'package:geoattend/presentation/attendance/widgets/createAttendance/create_attendance_form_widget.dart';
import 'package:loader_overlay/loader_overlay.dart';

class CreateAttendanceViewWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  const CreateAttendanceViewWidget({
    super.key,
    required this.successfulUserDataStatus,
  });

  @override
  State<CreateAttendanceViewWidget> createState() =>
      _CreateAttendanceViewWidgetState();
}

class _CreateAttendanceViewWidgetState
    extends State<CreateAttendanceViewWidget> {
  late SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  void initState() {
    successfulUserDataStatus = widget.successfulUserDataStatus;
    BlocProvider.of<AttendanceBloc>(context)
        .add(const LoadTimeZonesAttendanceEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is AttendanceDetailsValidationState) {
            if (state.loadingState) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
              if (state.successfulStatus!) {
                context.router.push(
                  SetUpAttendanceGeoFenceRoute(
                    successfulUserDataStatus: successfulUserDataStatus,
                    attendanceData: state.attendanceData!,
                  ),
                );
              }
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
                AppBackButtonTitleInfoWidget(
                  infoDetailsFunctionality: () {},
                  title: AppStringConstants.createAttendanceLabel,
                ),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                const CreateAttendanceDesWidget(),
                const AppSpacerWidget(
                  height: 20.0,
                ),
                Expanded(
                  child: CreateAttendanceFormWidget(
                    userDataStatus: successfulUserDataStatus,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
