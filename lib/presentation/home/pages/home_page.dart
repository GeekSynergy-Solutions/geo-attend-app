import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/presentation/home/widgets/home_view_widget.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  const HomePage({
    super.key,
    required this.successfulUserDataStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      left: false,
      top: false,
      right: false,
      child: HomeViewWidget(
        successfulUserDataStatus: successfulUserDataStatus,
      ),
    );
  }
}
