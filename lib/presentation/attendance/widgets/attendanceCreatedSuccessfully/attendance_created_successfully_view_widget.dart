import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/event/attendance_event.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';
import 'package:geoattend/presentation/attendance/widgets/attendanceCreatedSuccessfully/attendance_created_successfully_des_widget.dart';

class AttendanceCreatedSuccessfullyViewWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  final AttendanceData attendanceData;
  const AttendanceCreatedSuccessfullyViewWidget({
    super.key,
    required this.successfulUserDataStatus,
    required this.attendanceData,
  });

  @override
  State<AttendanceCreatedSuccessfullyViewWidget> createState() =>
      _AttendanceCreatedSuccessfullyViewWidgetState();
}

class _AttendanceCreatedSuccessfullyViewWidgetState
    extends State<AttendanceCreatedSuccessfullyViewWidget> {
  late SuccessfulUserDataStatus successfulUserDataStatus;
  late AttendanceData attendanceData;

  @override
  void initState() {
    successfulUserDataStatus = widget.successfulUserDataStatus;
    attendanceData = widget.attendanceData;
    BlocProvider.of<AttendanceBloc>(context)
        .add(const ShowAttendanceCodeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is ShowAttendanceCodeState) {
            GeneralFunctions.showShareAttndCodeBottomSheetDialog(
              context: context,
              attendanceCode: attendanceData.attendanceCode,
            );
          }
        },
        child: const NetworkRequestLoadingOverlayWidget(
          child: AppBodyPaddingWidget(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBackButtonWidget(),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: AttendanceCreatedSuccessfullyDesWidget(),
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
