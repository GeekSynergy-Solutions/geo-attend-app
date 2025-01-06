import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/di/injection.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/widgets/hostDetailsSummary/host_details_summary_view_widget.dart';

@RoutePage()
class AttendanceDetailsSummaryPage extends StatelessWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  final AttendanceData attendanceData;
  const AttendanceDetailsSummaryPage({super.key, required this.successfulUserDataStatus, required this.attendanceData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      top: false,
      right: false,
      child: BlocProvider(
        create: (context) => getIt<AttendanceBloc>(),
        child: HostDetailsSummaryViewWidget(
          attendanceData: attendanceData,
          successfulUserDataStatus: successfulUserDataStatus,
        ),
      ),
    );
  }
}
