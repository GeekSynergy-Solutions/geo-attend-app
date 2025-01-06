import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_values_data.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appBackButton/app_back_button_info_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/networkRequestLoadingOverlay/network_request_loading_overlay_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';
import 'package:geoattend/presentation/attendance/widgets/setUpAttendanceGeoFence/set_up_geo_fence_des_widget.dart';
import 'package:geoattend/presentation/attendance/widgets/setUpAttendanceGeoFence/set_up_geo_fence_map_widget.dart';

class SetUpGeoFenceViewWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  final AttendanceData attendanceData;
  const SetUpGeoFenceViewWidget({
    super.key,
    required this.attendanceData,
    required this.successfulUserDataStatus,
  });

  @override
  State<SetUpGeoFenceViewWidget> createState() =>
      _SetUpGeoFenceViewWidgetState();
}

class _SetUpGeoFenceViewWidgetState extends State<SetUpGeoFenceViewWidget> {
  bool geoFenceSettingsReady = false;

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
    final bool isKeyBoardOpen =
        GeneralFunctions.getDeviceViewInsets(context: context).bottom > 0;
    return Scaffold(
      body: BlocListener<AttendanceBloc, AttendanceState>(
        listener: (context, state) {
          if (state is GeoLocationPositionAttendanceState) {
            // LocationPositionData locationPositionData =
            //     state.locationPositionData!;
            setState(() {
              // geoFenceSettingsReady =
              //     locationPositionData.location.isNotEmpty &&
              //         locationPositionData.positionLat > 0 &&
              //         locationPositionData.positionLng > 0;
              bool isLocationSet = state.setLocation;
              if (isLocationSet) {
                attendanceData.attendanceLocationPositionData =
                    state.locationPositionData!;
              } else {
                geoFenceSettingsReady = isLocationSet;
              }
            });
          }

          if (state is SetGeoFenceDataSettingAttendanceState) {
            setState(() {
              geoFenceSettingsReady = state.geoFenceDataSet;
              if (geoFenceSettingsReady) {
                GeoFenceValuesData geoFenceValuesData =
                    state.geoFenceValuesData;
                attendanceData.geoFenceValuesData = geoFenceValuesData;
                attendanceData.attendanceGeoFenceType =
                    geoFenceValuesData.isItForRadius
                        ? AppStringConstants.circularLabel
                        : AppStringConstants.polygonLabel;
                attendanceData.attendanceAllowableDistance =
                    '${geoFenceValuesData.isItForRadius ? geoFenceValuesData.circularRadius : geoFenceValuesData.circularRadius}m';
                debugPrint(
                    'here is the geoFence $attendanceData ${attendanceData.attendanceAllowableDistance}');
              }
            });
          }
        },
        child: NetworkRequestLoadingOverlayWidget(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        right: 20.0,
                        top: 50.0,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBackButtonInfoWidget(
                              infoDetailsFunctionality: () {},
                            ),
                            const AppSpacerWidget(
                              height: 20.0,
                            ),
                            SetUpGeoFenceDesWidget(
                              attendanceData: attendanceData,
                            ),
                            const AppSpacerWidget(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (!isKeyBoardOpen)
                    Expanded(
                      child: SetUpGeoFenceMapWidget(
                        locationData:
                            attendanceData.attendanceLocationPositionData,
                      ),
                    ),
                ],
              ),
              if (geoFenceSettingsReady)
                Positioned(
                  left: 1,
                  right: 1,
                  bottom: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 20.0,
                    ),
                    child: AppButtonWidget(
                      appButtonFunctionality: () {
                        context.router.push(AttendanceDetailsSummaryRoute(
                          successfulUserDataStatus: successfulUserDataStatus,
                          attendanceData: attendanceData,
                        ));
                      },
                      decoration: BoxDecoration(
                        color: AppColors.activeButtonBgColor,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      height: 50.0,
                      child: Center(
                        child: Text(
                          AppStringConstants.continueLabel,
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
