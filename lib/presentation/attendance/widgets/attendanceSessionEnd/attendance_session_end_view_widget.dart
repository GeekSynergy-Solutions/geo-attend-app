import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBodyPadding/app_body_padding_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';
import 'package:geoattend/presentation/attendance/widgets/attendanceSessionEnd/attendance_session_end_desc_widget.dart';

class AttendanceSessionEndViewWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  const AttendanceSessionEndViewWidget({
    super.key,
    required this.successfulUserDataStatus,
  });

  @override
  State<AttendanceSessionEndViewWidget> createState() =>
      _AttendanceSessionEndViewWidgetState();
}

class _AttendanceSessionEndViewWidgetState
    extends State<AttendanceSessionEndViewWidget> {
  late SuccessfulUserDataStatus successfulUserDataStatus;

  @override
  void initState() {
    successfulUserDataStatus = widget.successfulUserDataStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {},
        child: const NetworkRequestLoadingOverlayWidget(
          child: AppBodyPaddingWidget(
            padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 50.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBackButtonWidget(),
                Expanded(
                  child: AttendanceSessionEndDescWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
