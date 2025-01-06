import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/attndFieldData/attendance_field_data.dart';
import 'package:geoattend/domain/entity/request/attendance/create/formFieldData/form_field_data_request.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/event/attendance_event.dart';
import 'package:geoattend/presentation/attendance/widgets/hostDetailsSummary/custom_host_details_widget.dart';

class HostDetailsSummaryDetailsWidget extends StatefulWidget {
  final AttendanceData attendanceData;
  const HostDetailsSummaryDetailsWidget({
    super.key,
    required this.attendanceData,
  });

  @override
  State<HostDetailsSummaryDetailsWidget> createState() =>
      _HostDetailsSummaryDetailsWidgetState();
}

class _HostDetailsSummaryDetailsWidgetState
    extends State<HostDetailsSummaryDetailsWidget> {
  late AttendanceData attendanceData;
  List<AttendanceFieldData> attendanceFields = [];

  @override
  void initState() {
    attendanceFields = GeneralConstantValues.attendanceFields;
    attendanceData = widget.attendanceData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            checkLabelWidget(
              checked: true,
              label: AppStringConstants.recuringLabel(
                period: attendanceData.attendanceRecurringMode,
              ),
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHostDetailsWidget(
                  description: attendanceData.attendanceHostName,
                  icon: AppImagePath.userSvg,
                  title: AppStringConstants.hostLabel,
                ),
                CustomHostDetailsWidget(
                  description: GeneralFunctions.formatDate(
                    dateString: attendanceData.attendanceDate,
                  ),
                  icon: AppImagePath.calendarSvg,
                  title: AppStringConstants.dateLabel,
                ),
              ],
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHostDetailsWidget(
                  description: attendanceData.attendanceStartTime,
                  icon: AppImagePath.clockSvg,
                  title: AppStringConstants.startTimeLabel,
                ),
                CustomHostDetailsWidget(
                  description: attendanceData.attendanceEndTime,
                  icon: AppImagePath.clockSvg,
                  title: AppStringConstants.endTimeLabel,
                ),
              ],
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            CustomHostDetailsWidget(
              description:
                  attendanceData.attendanceLocationPositionData.location,
              icon: AppImagePath.locationSvg,
              title: AppStringConstants.meetingLocLabel,
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            checkLabelWidget(
              checked: true,
              label: AppStringConstants.geoFenceRadiusLabel(
                distance: attendanceData.attendanceAllowableDistance,
                geoFenceType: attendanceData.attendanceGeoFenceType,
              ),
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            Text(
              AppStringConstants.attendanceDataFieldLabel,
              style: const TextStyle(
                color: AppColors.textDarkerColor,
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const AppSpacerWidget(
              height: 5.0,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3,
              ),
              itemCount: attendanceFields.length,
              itemBuilder: (context, index) {
                AttendanceFieldData attndFieldData = attendanceFields[index];
                return checkLabelWidget(
                  checked: attndFieldData.checked,
                  label: attndFieldData.field,
                  functionality: () {
                    setState(() {
                      attndFieldData.checked = !attndFieldData.checked;
                    });
                    if (attndFieldData.checked) {
                      FormFieldDataRequest tempData = FormFieldDataRequest(
                        fieldName: attndFieldData.field,
                        fieldType: 'text',
                        required: true,
                        options: const [],
                      );
                      attendanceData.formFields!.add(tempData);
                      BlocProvider.of<AttendanceBloc>(context).add(
                        UpdateAttendanceDataEvent(
                          attendanceData: attendanceData,
                        ),
                      );
                    }
                  },
                );
              },
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: AppButtonWidget(
                  appButtonFunctionality: () {
                    BlocProvider.of<AttendanceBloc>(context).add(
                      CreateHostAttendanceEvent(
                        attendanceData: attendanceData,
                      ),
                    );
                  },
                  decoration: BoxDecoration(
                    color: AppColors.activeButtonBgColor,
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  height: 50.0,
                  child: Center(
                    child: Text(
                      AppStringConstants.createDesLabel(desc: 'Attendance'),
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkLabelWidget(
      {required bool checked,
      required String label,
      VoidCallback? functionality}) {
    return Row(
      children: [
        detailsCheckWidget(
          checked: checked,
          functionality: functionality ?? () {},
        ),
        const AppSpacerWidget(
          width: 5.0,
        ),
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.textDarkerColor,
              fontSize: 14.0,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  Widget detailsCheckWidget({
    required bool checked,
    required VoidCallback functionality,
  }) {
    return InkWell(
      onTap: functionality,
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            5.0,
          ),
          color: checked ? AppColors.attdDetailsCheckedBorderFillColor : null,
          border: Border.all(
            color: AppColors.attdDetailsCheckedBorderFillColor,
          ),
        ),
        child: checked
            ? const Center(
                child: Icon(
                  Icons.check,
                  color: AppColors.attdDetailsCheckColor,
                  size: 16.0,
                  weight: 2.0,
                ),
              )
            : Container(),
      ),
    );
  }
}
