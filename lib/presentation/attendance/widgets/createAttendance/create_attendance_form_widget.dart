import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/errorFieldData/attendanceFieldValidation/attendance_field_validation.dart';
import 'package:geoattend/domain/entity/objectData/recurringOptionData/recurring_option_data.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/domain/entity/objectData/timeZone/time_zone_data.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appTextField/app_text_field_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/event/attendance_event.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';

class CreateAttendanceFormWidget extends StatefulWidget {
  final SuccessfulUserDataStatus userDataStatus;
  const CreateAttendanceFormWidget({
    super.key,
    required this.userDataStatus,
  });

  @override
  State<CreateAttendanceFormWidget> createState() =>
      _CreateAttendanceFormWidgetState();
}

class _CreateAttendanceFormWidgetState
    extends State<CreateAttendanceFormWidget> {
  final TextEditingController attendanceNameController =
      TextEditingController();
  final TextEditingController attendanceDateController =
      TextEditingController();
  final TextEditingController attendanceStartTimeController =
      TextEditingController();
  final TextEditingController attendanceEndTimeController =
      TextEditingController();
  final TextEditingController attendanceDbStartTimeController =
      TextEditingController();
  final TextEditingController attendanceDbEndTimeController =
      TextEditingController();
  final TextEditingController attendanceDescController =
      TextEditingController();

  List<TimeZoneData> timezones = [];

  List<RecurringOptionData> recurringOptions =
      GeneralConstantValues.recurringOptions;

  TimeZoneData selectedTimeZoneData = GeneralConstantValues.defaultTimeZoneData;
  RecurringOptionData selectedRecurringOptions =
      GeneralConstantValues.defaultRecurringOptionData;

  bool isRequestInProgress = false;

  bool addAttendanceDesc = true;

  final formKey = GlobalKey<FormState>();

  bool validated = false;

  String attendanceRecurringValue = '';
  String attendanceTimeZoneValue = '';

  AttendanceFieldValidation attendanceFieldValidation =
      AttendanceFieldValidation(
    isAttendanceDateValid: true,
    isAttendanceDescValid: true,
    isAttendanceEndTimeValid: true,
    isAttendanceNameValid: true,
    isAttendanceRecurringValid: true,
    isAttendanceStartTimeValid: true,
    isAttendanceTimeZoneValid: true,
  );

  TimeOfDay? selectedStartTimeOfDay;
  TimeOfDay? selectedEndTimeOfDay;
  DateTime? selectedDateTime;

  late SuccessfulUserDataStatus userDataStatus;

  @override
  void initState() {
    userDataStatus = widget.userDataStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceBloc, AttendanceState>(
      listener: (context, state) {
        if (state is TimeZonesAttendanceState) {
          setState(() {
            timezones = state.timeZones;
            selectedTimeZoneData = timezones.first;
          });
        }

        if (state is AttendanceDetailsValidationState) {
          if (!state.successfulStatus! && !state.loadingState) {
            setState(() {
              attendanceFieldValidation = state.attendanceFieldValidation!;
            });
            GeneralFunctions.snackBarMessage(
              context: context,
              message: state.message ?? '',
            );
          }
        }
      },
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextFieldWidget(
                controller: attendanceNameController,
                enabled: !isRequestInProgress,
                errorText: !attendanceFieldValidation.isAttendanceNameValid
                    ? AppStringConstants.attendanceNameFieldEmptyError
                    : null,
                hintText: AppStringConstants.attendanceNameHint,
                isThereAnError:
                    !attendanceFieldValidation.isAttendanceNameValid,
                keyboardType: TextInputType.text,
                title: AppStringConstants.attendanceNameLabel,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      attendanceFieldValidation.isAttendanceNameValid = true;
                    });
                  }
                },
              ),
              InkWell(
                onTap: () async {
                  selectedDateTime =
                      await GeneralFunctions.openDateCalendarAndGetDateTime(
                    context: context,
                  );
                  setState(() {
                    attendanceDateController.text = GeneralFunctions.formatDate(
                        dateString: selectedDateTime!.toIso8601String());
                    attendanceFieldValidation.isAttendanceDateValid =
                        attendanceDateController.text.isNotEmpty;
                  });
                },
                child: AppTextFieldWidget(
                  controller: attendanceDateController,
                  enabled: false,
                  errorText: !attendanceFieldValidation.isAttendanceDateValid
                      ? AppStringConstants.attendanceDateFieldEmptyError
                      : null,
                  hintText: AppStringConstants.attendanceDateHint,
                  isThereAnError:
                      !attendanceFieldValidation.isAttendanceDateValid,
                  keyboardType: TextInputType.text,
                  title: AppStringConstants.attendanceDateLabel,
                  suffixIcon: const Icon(
                    Icons.calendar_month,
                    color: AppColors.calendarIconColor,
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        attendanceFieldValidation.isAttendanceDateValid = true;
                      });
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        selectedStartTimeOfDay = await GeneralFunctions
                            .openTimePickerCalendarAndTime(
                          context: context,
                        );
                        setState(() {
                          if (attendanceEndTimeController.text.isNotEmpty &&
                              attendanceDbEndTimeController.text.isNotEmpty) {
                            if (!(selectedStartTimeOfDay!.hour <=
                                    selectedEndTimeOfDay!.hour &&
                                selectedStartTimeOfDay!.minute <
                                    selectedEndTimeOfDay!.minute)) {
                              attendanceEndTimeController.clear();
                              attendanceDbEndTimeController.clear();
                            }
                          }
                          attendanceStartTimeController.text =
                              selectedStartTimeOfDay!.format(context);
                          attendanceDbStartTimeController.text =
                              GeneralFunctions.convertTimeOfDayToDateTime(
                            timeOfDay: selectedStartTimeOfDay!,
                          ).toIso8601String();
                          attendanceFieldValidation.isAttendanceStartTimeValid =
                              attendanceStartTimeController.text.isNotEmpty;
                        });
                      },
                      child: AppTextFieldWidget(
                        controller: attendanceStartTimeController,
                        enabled: false,
                        errorText: !attendanceFieldValidation
                                .isAttendanceStartTimeValid
                            ? AppStringConstants
                                .attendanceStartTimeFieldEmptyError
                            : null,
                        hintText: AppStringConstants.attendanceStartTimeHint,
                        isThereAnError: !attendanceFieldValidation
                            .isAttendanceStartTimeValid,
                        keyboardType: TextInputType.text,
                        title: AppStringConstants.attendanceStartTimeLabel,
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.arrowDownIconColor,
                        ),
                      ),
                    ),
                  ),
                  const AppSpacerWidget(
                    width: 10.0,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        selectedEndTimeOfDay = await GeneralFunctions
                            .openTimePickerCalendarAndTime(
                          context: context,
                        );
                        setState(() {
                          if (selectedStartTimeOfDay == null) {
                            attendanceEndTimeController.text =
                                selectedEndTimeOfDay!.format(context);
                            attendanceDbEndTimeController.text =
                                GeneralFunctions.convertTimeOfDayToDateTime(
                              timeOfDay: selectedEndTimeOfDay!,
                            ).toIso8601String();
                          } else {
                            int endTimeHour =
                                selectedEndTimeOfDay!.period == DayPeriod.am
                                    ? selectedEndTimeOfDay!.hour
                                    : selectedEndTimeOfDay!.hour + 12;
                            int startTimeHour =
                                selectedStartTimeOfDay!.period == DayPeriod.am
                                    ? selectedStartTimeOfDay!.hour
                                    : selectedStartTimeOfDay!.hour + 12;
                            if (startTimeHour <= endTimeHour &&
                                (startTimeHour == endTimeHour
                                    ? selectedStartTimeOfDay!.minute <
                                        selectedEndTimeOfDay!.minute
                                    : true)) {
                              attendanceEndTimeController.text =
                                  selectedEndTimeOfDay!.format(context);
                              attendanceDbEndTimeController.text =
                                  GeneralFunctions.convertTimeOfDayToDateTime(
                                timeOfDay: selectedEndTimeOfDay!,
                              ).toIso8601String();
                            } else {
                              attendanceEndTimeController.clear();
                              attendanceDbEndTimeController.clear();
                            }
                          }
                          attendanceFieldValidation.isAttendanceEndTimeValid =
                              attendanceEndTimeController.text.isNotEmpty;
                        });
                      },
                      child: AppTextFieldWidget(
                        controller: attendanceEndTimeController,
                        enabled: false,
                        errorText:
                            !attendanceFieldValidation.isAttendanceEndTimeValid
                                ? AppStringConstants
                                    .attendanceEndTimeFieldEmptyError
                                : null,
                        hintText: AppStringConstants.attendanceEndTimeHint,
                        isThereAnError:
                            !attendanceFieldValidation.isAttendanceEndTimeValid,
                        keyboardType: TextInputType.text,
                        title: AppStringConstants.attendanceEndTimeLabel,
                        suffixIcon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.arrowDownIconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              otherAttendanceField(
                label: AppStringConstants.attendanceDescLabel,
                innerChildFieldVisibility: addAttendanceDesc,
                innerChildField: AppTextFieldWidget(
                  controller: attendanceDescController,
                  enabled: !isRequestInProgress,
                  errorText: !attendanceFieldValidation.isAttendanceDescValid
                      ? AppStringConstants.attendanceDescFieldEmptyError
                      : null,
                  hintText: AppStringConstants.attendanceDescHint,
                  maintainDefaultHeight: false,
                  isThereAnError:
                      !attendanceFieldValidation.isAttendanceDescValid,
                  keyboardType: TextInputType.text,
                  title: '',
                  maxLines: 5,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        attendanceFieldValidation.isAttendanceDescValid = true;
                      });
                    }
                  },
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      addAttendanceDesc = !addAttendanceDesc;
                    });
                  },
                  child: Icon(
                    addAttendanceDesc ? Icons.remove : Icons.add,
                  ),
                ),
              ),
              otherAttendanceField(
                label: AppStringConstants.attendanceTimeZoneLabel,
                innerChildFieldVisibility: false,
                innerChildField: Container(),
                child: SizedBox(
                  width: 170,
                  child: DropdownButtonFormField(
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    isExpanded: true,
                    alignment: AlignmentDirectional.topEnd,
                    items: List.generate(timezones.length, (index) {
                      TimeZoneData timeZone = timezones[index];
                      String tZone = GeneralFunctions.convertToUpperCaseChar(
                          value: timeZone.abbr);
                      return DropdownMenuItem(
                        value: timeZone,
                        enabled: !isRequestInProgress,
                        child: Text(
                          '$tZone ${timeZone.isItAPositiveOffset! ? '(UTC +${timeZone.offset})' : '(UTC ${timeZone.offset})'}',
                          style: GeneralConstantValues.dropDownTextStyle(
                            enabled: !isRequestInProgress,
                          ),
                        ),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedTimeZoneData = value!;
                      });
                    },
                    value: selectedTimeZoneData,
                    decoration: InputDecoration(
                      filled: false,
                      fillColor: AppColors.whiteBgColor,
                      hintText: AppStringConstants.timeZoneHintLabel,
                      hintStyle: GeneralConstantValues.hintTextStyle,
                      errorText:
                          !attendanceFieldValidation.isAttendanceTimeZoneValid
                              ? AppStringConstants.timeZoneError
                              : null,
                      errorMaxLines: GeneralConstantValues.errorMaxLines,
                      border: GeneralConstantValues.noTextFieldBorder,
                      focusedBorder: GeneralConstantValues.noTextFieldBorder,
                      disabledBorder: GeneralConstantValues.noTextFieldBorder,
                      enabledBorder: GeneralConstantValues.noTextFieldBorder,
                      contentPadding:
                          GeneralConstantValues.dropDownContentPaddingConstant,
                    ),
                  ),
                ),
              ),
              otherAttendanceField(
                label: AppStringConstants.attendanceRecurringLabel,
                innerChildFieldVisibility: false,
                innerChildField: Container(),
                child: SizedBox(
                  width: 120,
                  child: DropdownButtonFormField(
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                    ),
                    isExpanded: true,
                    items: List.generate(recurringOptions.length, (index) {
                      RecurringOptionData recurringOptionData =
                          recurringOptions[index];
                      String option = GeneralFunctions.convertToUpperCaseChar(
                          value: recurringOptionData.option);
                      return DropdownMenuItem(
                        value: recurringOptionData,
                        enabled: !isRequestInProgress,
                        child: Text(
                          option,
                          style: GeneralConstantValues.dropDownTextStyle(
                            enabled: !isRequestInProgress,
                          ),
                        ),
                      );
                    }),
                    onChanged: (value) {
                      setState(() {
                        selectedRecurringOptions = value!;
                      });
                    },
                    value: selectedRecurringOptions,
                    decoration: InputDecoration(
                      filled: false,
                      fillColor: AppColors.whiteBgColor,
                      hintText: AppStringConstants.timeZoneHintLabel,
                      hintStyle: GeneralConstantValues.hintTextStyle,
                      errorText:
                          !attendanceFieldValidation.isAttendanceTimeZoneValid
                              ? AppStringConstants.timeZoneError
                              : null,
                      errorMaxLines: GeneralConstantValues.errorMaxLines,
                      border: GeneralConstantValues.noTextFieldBorder,
                      focusedBorder: GeneralConstantValues.noTextFieldBorder,
                      disabledBorder: GeneralConstantValues.noTextFieldBorder,
                      enabledBorder: GeneralConstantValues.noTextFieldBorder,
                      contentPadding:
                          GeneralConstantValues.dropDownContentPaddingConstant,
                    ),
                  ),
                ),
              ),
              const AppSpacerWidget(
                height: 10.0,
              ),
              AppButtonWidget(
                appButtonFunctionality: () {
                  BlocProvider.of<AttendanceBloc>(context).add(
                    AttendanceDetailsValidationEvent(
                      date: attendanceDateController.text.isNotEmpty
                          ? selectedDateTime!.toIso8601String()
                          : '',
                      dbEndTime: attendanceDbEndTimeController.text,
                      dbStartTime: attendanceDbStartTimeController.text,
                      description: attendanceDescController.text,
                      endTime: attendanceEndTimeController.text,
                      hostName:
                          userDataStatus.verifiedUserDataResponse.firstName,
                      name: attendanceNameController.text,
                      recurringMode: selectedRecurringOptions.option,
                      startTime: attendanceStartTimeController.text,
                      timeZone: selectedTimeZoneData.value,
                      timeZoneOffset:
                          '${selectedTimeZoneData.isItAPositiveOffset! ? '+${selectedTimeZoneData.offset}' : selectedTimeZoneData.offset}',
                      context: context,
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
                    AppStringConstants.nextLabel,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
              const AppSpacerWidget(
                height: 40.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget otherAttendanceField({
    required String label,
    required Widget child,
    required Widget innerChildField,
    required bool innerChildFieldVisibility,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: AppColors.textFieldLabelColor,
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: child,
                ),
              ),
            ],
          ),
          const AppSpacerWidget(
            height: 2.5,
          ),
          if (innerChildFieldVisibility) innerChildField,
          const Divider(
            color: AppColors.attendanceFormDividerColor,
          ),
        ],
      ),
    );
  }
}
