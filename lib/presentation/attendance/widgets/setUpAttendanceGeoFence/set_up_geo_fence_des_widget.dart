import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocation/here_location_model.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocationData/here_location_data_model.dart';
import 'package:geoattend/domain/entity/errorFieldData/attendanceFieldValidation/set_up_geo_fence_validation.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/distance_radius_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_type_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_values_data.dart';
import 'package:geoattend/domain/entity/objectData/locationPositionData/location_position_data.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appTextField/app_text_field_widget.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/event/attendance_event.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';

class SetUpGeoFenceDesWidget extends StatefulWidget {
  final AttendanceData attendanceData;
  const SetUpGeoFenceDesWidget({
    super.key,
    required this.attendanceData,
  });

  @override
  State<SetUpGeoFenceDesWidget> createState() => _SetUpGeoFenceDesWidgetState();
}

class _SetUpGeoFenceDesWidgetState extends State<SetUpGeoFenceDesWidget> {
  final TextEditingController locationAddressController =
      TextEditingController();
  bool hasAnAddressBeSet = false;
  SetUpGeoFenceValidation setUpGeoFenceValidation = SetUpGeoFenceValidation(
    isLocationAddressValid: true,
  );

  late AttendanceData attendanceData;

  LocationPositionData locationPositionData = LocationPositionData();

  HereLocationModel? hereLocationModel;

  bool showRemoteLocationAddresses = false;

  bool enableFieldForAddress = true;

  bool geoFenceSettingSet = false;

  List<GeoFenceTypeData> genFenceTypes = [];

  late GeoFenceTypeData selectedGenFenceType;

  double currentSetValue = 0.0;

  @override
  void initState() {
    attendanceData = widget.attendanceData;
    locationPositionData = attendanceData.attendanceLocationPositionData;
    genFenceTypes = GeneralConstantValues.geoFenceTypes;
    selectedGenFenceType = genFenceTypes.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AttendanceBloc, AttendanceState>(
      listener: (context, state) {
        if (state is GeoLocationPositionAttendanceState) {
          setState(() {
            // hasAnAddressBeSet = locationPositionData.location.isNotEmpty &&
            //     locationPositionData.positionLat > 0 &&
            //     locationPositionData.positionLng > 0;
            hasAnAddressBeSet = state.setLocation;
            enableFieldForAddress = !hasAnAddressBeSet;
            if (!hasAnAddressBeSet) {
              geoFenceSettingSet = hasAnAddressBeSet;
            }
          });
          if (state.setLocation) {
            getGeoFenceRadius(context);
          }
        }

        if (state is GeoLocationAddressAttendanceState) {
          if (state.success != null) {
            setState(() {
              showRemoteLocationAddresses = state.success!;
              hereLocationModel = state.hereLocation;
            });
          }
        }

        if (state is SetGeoFenceDataSettingAttendanceState) {
          setState(() {
            geoFenceSettingSet = state.geoFenceDataSet;
          });
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStringConstants.setUpGeoFenceLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: AppColors.textDarkerColor,
            ),
            textAlign: TextAlign.left,
          ),
          const AppSpacerWidget(
            height: 10.0,
          ),
          Text(
            AppStringConstants.setUpGeoFenceDesc,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: AppColors.textLighterColor,
            ),
            textAlign: TextAlign.left,
          ),
          const AppSpacerWidget(
            height: 10.0,
          ),
          // Row(
          //   children: [
          AppTextFieldWidget(
            controller: locationAddressController,
            enabled: enableFieldForAddress,
            allowBottomPadding: enableFieldForAddress
                ? !showRemoteLocationAddresses
                : geoFenceSettingSet,
            errorText: !setUpGeoFenceValidation.isLocationAddressValid
                ? AppStringConstants.attendanceNameFieldEmptyError
                : null,
            hintText: AppStringConstants.setUpGeoFenceAddressHint,
            isThereAnError: !setUpGeoFenceValidation.isLocationAddressValid,
            keyboardType: TextInputType.text,
            title: AppStringConstants.setUpGeoFenceLocationAddressLabel,
            widgetAlongSideTitle: enableFieldForAddress
                ? null
                : InkWell(
                    onTap: () {
                      setState(() {
                        enableFieldForAddress = true;
                        locationAddressController.clear();
                      });
                      BlocProvider.of<AttendanceBloc>(context)
                          .add(const ResetLocAddressAttendanceEvent());
                    },
                    child: const Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: Icon(
                        Icons.close,
                        color: AppColors.iconPrimaryColor,
                      ),
                    ),
                  ),
            suffixIcon: enableFieldForAddress
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        locationAddressController.clear();
                      });
                    },
                    icon: const Icon(
                      Icons.cancel,
                      color: AppColors.iconPrimaryColor,
                    ),
                  )
                : null,
            onChanged: (value) {
              if (value.isNotEmpty) {
                BlocProvider.of<AttendanceBloc>(context).add(
                  GetLocationAddressAttendanceEvent(
                    address: value,
                  ),
                );
                setState(() {
                  setUpGeoFenceValidation.isLocationAddressValid = true;
                });
              }
            },
          ),
          if (hereLocationModel != null && showRemoteLocationAddresses)
            SizedBox(
              width: double.infinity,
              child: Card(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(hereLocationModel!.items.length,
                          (index) {
                        HereLocationDataModel locationDataModel =
                            hereLocationModel!.items[index];
                        // String address =
                        //     '${locationDataModel.address.street}, ${locationDataModel.address.city} ${locationDataModel.address.state} ${locationDataModel.address.countryName}';
                        String address = locationDataModel.address.label;
                        return InkWell(
                          onTap: () {
                            BlocProvider.of<AttendanceBloc>(context).add(
                                GetLocationPositionAttendanceEvent
                                    .remoteLocation(address: address));
                            setState(() {
                              locationAddressController.text = address;
                              showRemoteLocationAddresses = false;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              right: 10.0,
                              left: 10.0,
                              top: 10.0,
                              bottom: hereLocationModel!.items.last ==
                                      locationDataModel
                                  ? 10.0
                                  : 0.0,
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImagePath.locationSvg,
                                ),
                                const AppSpacerWidget(
                                  width: 3.0,
                                ),
                                Expanded(
                                  child: Text(
                                    address,
                                    style: const TextStyle(
                                      color: AppColors.textDarkerColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          if (hasAnAddressBeSet)
            // if (!geoFenceSettingSet)
            SizedBox(
              width: 130,
              child: DropdownButtonFormField(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                ),
                isExpanded: true,
                alignment: AlignmentDirectional.topEnd,
                items: List.generate(genFenceTypes.length, (index) {
                  GeoFenceTypeData geoFenceType = genFenceTypes[index];
                  return DropdownMenuItem(
                    value: geoFenceType,
                    enabled: true,
                    child: Text(
                      'Set ${geoFenceType.type}',
                      style: GeneralConstantValues.dropDownTextStyle(
                        enabled: true,
                      ),
                    ),
                  );
                }),
                onChanged: (value) {
                  setState(() {
                    selectedGenFenceType = value!;
                  });
                  getGeoFenceRadius(context);
                },
                value: selectedGenFenceType,
                decoration: InputDecoration(
                  hintText: AppStringConstants.timeZoneHintLabel,
                  hintStyle: GeneralConstantValues.hintTextStyle,
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
          if (!hasAnAddressBeSet)
            InkWell(
              onTap: () {
                setState(() {
                  locationAddressController.text =
                      locationPositionData.location;
                  hasAnAddressBeSet = true;
                  showRemoteLocationAddresses = false;
                });
                BlocProvider.of<AttendanceBloc>(context).add(
                  GetLocationPositionAttendanceEvent.currentLocation(
                    address: locationPositionData.location,
                    locationPositionData: locationPositionData,
                  ),
                );
              },
              child: Row(
                children: [
                  SvgPicture.asset(AppImagePath.currentLocationSvg),
                  const AppSpacerWidget(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStringConstants.setUpGeoUseCurrentLocLabel,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            color: AppColors.textDarkerColor,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const AppSpacerWidget(
                          height: 5.0,
                        ),
                        Text(
                          locationPositionData.location,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.0,
                            color: AppColors.textLighterColor,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          if (hasAnAddressBeSet)
            // if (!geoFenceSettingSet)
            Text(
              AppStringConstants.setUpGeoFenceAllowableDistDesc,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.0,
                color: AppColors.textLighterColor,
              ),
              textAlign: TextAlign.left,
            ),
        ],
      ),
    );
  }

  void getGeoFenceRadius(BuildContext context) {
    Future.delayed(Duration.zero).then((value) async {
      if (context.mounted) {
        dynamic setDistanceRadiusData =
            await GeneralFunctions.showGeoFenceTypeSettingBottomSheetDialog(
          context: context,
          type: selectedGenFenceType.isItForRadius
              ? ''
              : selectedGenFenceType.type,
          currentSetValue: currentSetValue,
        );
        if (setDistanceRadiusData is DistanceRadiusData && context.mounted) {
          setState(() {
            currentSetValue = setDistanceRadiusData.distance;
          });
          debugPrint('here is the given value of it $currentSetValue 1');
          BlocProvider.of<AttendanceBloc>(context).add(
            SetGeoFenceDataSettingAttendanceEvent(
                geoFenceValuesData: GeoFenceValuesData(
              isItForRadius: selectedGenFenceType.isItForRadius,
              polygonRadius: setDistanceRadiusData.distance,
              circularRadius: setDistanceRadiusData.distance,
            )),
          );
        }
      }
    });
  }
}
