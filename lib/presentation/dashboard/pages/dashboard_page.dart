import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/presentation/dashboard/widgets/dashboard_view_widget.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  const DashboardPage({super.key, required this.successfulUserDataStatus});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      top: false,
      right: false,
      child: DashboardViewWidget(
        successfulUserDataStatus: successfulUserDataStatus,
      ),
    );
  }
}
