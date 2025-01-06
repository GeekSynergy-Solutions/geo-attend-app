import 'dart:convert';
import 'dart:math';

import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geoattend/data/localStorage/flutterSecureStorage/app_flutter_secure_storage.dart';
import 'package:geoattend/data/localStorage/sharedPreferences/app_shared_preferences.dart';
import 'package:geoattend/data/remote/attendance/model/createSession/create_session_model.dart';
import 'package:geoattend/data/remote/geoLocation/model/hereGeoLocation/hereLocation/here_location_model.dart';
import 'package:geoattend/domain/entity/errorFieldData/attendanceFieldValidation/attendance_field_validation.dart';
import 'package:geoattend/domain/entity/objectData/attendanceData/attendance_data.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_values_data.dart';
import 'package:geoattend/domain/entity/objectData/locationPositionData/location_position_data.dart';
import 'package:geoattend/domain/entity/objectData/timeZone/time_zone_data.dart';
import 'package:geoattend/domain/entity/request/attendance/create/attndCreate/attnd_create_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/geoFence/geo_fence_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/geoFenceData/geo_fence_data_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/polygon/polygon_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/radius/radius_request.dart';
import 'package:geoattend/domain/entity/request/attendance/create/radiusData/radius_data_request.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/domain/entity/response/success/success_response.dart';
import 'package:geoattend/domain/repository/attendance/attendance_repo_interface.dart';
import 'package:geoattend/domain/repository/geoLocation/here_geo_location_repo_interface.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/getLocation/get_location.dart';
import 'package:geoattend/presentation/attendance/bloc/event/attendance_event.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';
import 'package:injectable/injectable.dart';
import 'package:latlong2/latlong.dart';

@injectable
class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  final AppSharedPreferences appSharedPreferences;
  final AppFlutterSecureStorage secureStorage;
  final HereGeoLocationRepoInterface hereGeoLocationRepo;
  final AttendanceRepoInterface attendanceRepo;

  AttendanceFieldValidation attendanceFieldValidation =
      AttendanceFieldValidation();

  HereLocationModel? hereLocation;
  HereLocationModel? herePosition;

  LocationPositionData locationPositionData = LocationPositionData();

  AttendanceData? updateAttendanceData;

  AttendanceBloc(
    this.appSharedPreferences,
    this.secureStorage,
    this.hereGeoLocationRepo,
    this.attendanceRepo,
  ) : super(const InitAttendanceState()) {
    on<LoadTimeZonesAttendanceEvent>((event, emit) async {
      String timeZonesRawData =
          await rootBundle.loadString('asset/files/timezones.json');
      List jsonMap = json.decode(timeZonesRawData);
      List<TimeZoneData> timeZones = List<TimeZoneData>.from(
        jsonMap.map(
          (timeZone) {
            return TimeZoneData.fromJson(timeZone);
          },
        ),
      );
      debugPrint('here are the data $timeZones');
      emit(
        TimeZonesAttendanceState(timeZones: timeZones),
      );
    });
    on<UpdateAttendanceDataEvent>((event, emit) {
      emit(
        UpdateAttendanceDataState.init(
          updatedAttendanceData: event.attendanceData,
        ),
      );
      updateAttendanceData = event.attendanceData;
      emit(
        UpdateAttendanceDataState.update(
          updatedAttendanceData: event.attendanceData,
        ),
      );
    });
    on<ShowAttendanceCodeEvent>((event, emit) {
      emit(
        const ShowAttendanceCodeState(),
      );
    });
    on<CreateHostAttendanceEvent>((event, emit) async {
      AttendanceData attendanceData = event.attendanceData;
      emit(CreateHostAttendanceState.loading());

      List<List<num>> polygonPoints = [];

      for (var polyPoints in attendanceData.geoFenceValuesData!.polygonPoints) {
        polygonPoints.add([polyPoints.latitude, polyPoints.longitude]);
      }

      Either<FailureResponse, SuccessResponse> createAttndRequest =
          await attendanceRepo.createAttendanceRepoRequest(
        request: AttndCreateRequest(
          attendanceAddress:
              attendanceData.attendanceLocationPositionData.location,
          attendanceDescription: attendanceData.attendanceDesc,
          attendanceName: attendanceData.attendanceName,
          endTime: attendanceData.attendanceDbEndTime,
          formFields: attendanceData.formFields ?? [],
          geofence: GeoFenceRequest(
            type: attendanceData.attendanceGeoFenceType ==
                    AppStringConstants.circularLabel
                ? AppStringConstants.radiusLabel
                : AppStringConstants.polygonLabel,
            data: GeoFenceDataRequest(
              polygon: !(attendanceData.attendanceGeoFenceType ==
                      AppStringConstants.circularLabel)
                  ? PolygonRequest(
                      coordinates: polygonPoints,
                    )
                  : null,
              radius: attendanceData.attendanceGeoFenceType ==
                      AppStringConstants.circularLabel
                  ? RadiusRequest(
                      center: RadiusDataRequest(
                        latitude: attendanceData
                            .attendanceLocationPositionData.positionLat,
                        longitude: attendanceData
                            .attendanceLocationPositionData.positionLng,
                      ),
                      radius: attendanceData.geoFenceValuesData!.circularRadius,
                    )
                  : null,
            ),
          ),
          maxFormFields: (attendanceData.formFields ?? []).length,
          parameters: attendanceData.parameterTypes ?? [],
          startTime: attendanceData.attendanceDbStartTime,
        ),
      );

      if (createAttndRequest.isRight) {
        CreateSessionModel createdSessionModel =
            CreateSessionModel.fromJson(createAttndRequest.right.data);
        attendanceData.attendanceCode = createdSessionModel.attendanceCode;
        emit(
          CreateHostAttendanceState.success(
            attendanceData: attendanceData,
          ),
        );
      } else {
        FailureResponse failedResponse = createAttndRequest.left;
        emit(
          CreateHostAttendanceState.failure(
            errorMessage: GeneralFunctions.convertFirstCharToUpperCaseChar(
              value: failedResponse.errorMessage,
            ),
            isRequestUnAuthorized:
                GeneralFunctions.checkIfRequestIsUnauthorized(
              statusCode: failedResponse.statusCode,
            ),
          ),
        );
      }
    });
    on<AttendanceDetailsValidationEvent>((event, emit) async {
      String date = event.date;
      String dbEndTime = event.dbEndTime;
      String dbStartTime = event.dbStartTime;
      String endTime = event.endTime;
      String startTime = event.startTime;
      String description = event.description;
      String name = event.name;
      String hostName = event.hostName;
      String recurringMode = event.recurringMode;
      String timeZone = event.timeZone;
      String timeZoneOffset = event.timeZoneOffset;
      BuildContext context = event.context;

      emit(
        AttendanceDetailsValidationState.validating(),
      );

      attendanceFieldValidation = AttendanceFieldValidation(
        isAttendanceDateValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(date),
        isAttendanceDescValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(description),
        isAttendanceEndTimeValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(endTime),
        isAttendanceDbEndTimeValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(dbEndTime),
        isAttendanceNameValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(name),
        isAttendanceHostNameValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(hostName),
        isAttendanceRecurringValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(recurringMode),
        isAttendanceStartTimeValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(startTime),
        isAttendanceDbStartTimeValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(dbStartTime),
        isAttendanceTimeZoneValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(timeZone),
        isAttendanceTimeZoneOffsetValid:
            !GeneralFunctions.checkFieldIfStringIsEmpty(timeZoneOffset),
      );

      attendanceFieldValidation.fieldValidationStatus =
          attendanceFieldValidation.isAttendanceDateValid &&
              attendanceFieldValidation.isAttendanceDescValid &&
              attendanceFieldValidation.isAttendanceEndTimeValid &&
              attendanceFieldValidation.isAttendanceDbEndTimeValid &&
              attendanceFieldValidation.isAttendanceHostNameValid &&
              attendanceFieldValidation.isAttendanceNameValid &&
              attendanceFieldValidation.isAttendanceRecurringValid &&
              attendanceFieldValidation.isAttendanceStartTimeValid &&
              attendanceFieldValidation.isAttendanceDbStartTimeValid &&
              attendanceFieldValidation.isAttendanceTimeZoneOffsetValid &&
              attendanceFieldValidation.isAttendanceTimeZoneValid;
      if (attendanceFieldValidation.fieldValidationStatus) {
        Either<FailureResponse, CurrentLatLngAddressModel> locationDataRequest =
            await GetCurrentLocation.getCurrentPosition(
          context: context,
        );
        if (locationDataRequest.isRight) {
          emit(
            AttendanceDetailsValidationState.success(
              attendanceData: AttendanceData(
                attendanceHostName: hostName,
                attendanceName: name,
                attendanceDesc: description,
                attendanceRecurringMode: recurringMode,
                attendanceDate: date,
                attendanceStartTime: startTime,
                attendanceEndTime: endTime,
                attendanceDbStartTime: dbStartTime,
                attendanceDbEndTime: dbEndTime,
                attendanceMeetingLocation: '',
                attendanceAllowableDistance: '',
                attendanceLocationPositionData: LocationPositionData(
                  location: locationDataRequest.right.address,
                  positionLat: locationDataRequest.right.latlng.latitude,
                  positionLng: locationDataRequest.right.latlng.longitude,
                ),
              ),
            ),
          );
        } else {
          emit(
            AttendanceDetailsValidationState.failure(
              message: locationDataRequest.left.errorMessage,
              attendanceFieldValidation: attendanceFieldValidation,
            ),
          );
        }
      } else {
        emit(
          AttendanceDetailsValidationState.failure(
            message: GeneralConstantValues.requiredFieldMessage,
            attendanceFieldValidation: attendanceFieldValidation,
          ),
        );
      }
    });
    on<ResetLocAddressAttendanceEvent>((event, emit) {
      emit(
        GeoLocationPositionAttendanceState.reset(),
      );
      emit(
        SetGeoFenceDataSettingAttendanceState.reset(
          geoFenceValuesData: GeoFenceValuesData(),
        ),
      );
    });
    on<SetGeoFenceDataSettingAttendanceEvent>((event, emit) {
      GeoFenceValuesData geoFenceValuesData = event.geoFenceValuesData;
      if (geoFenceValuesData.isItForRadius) {
        List<LatLng> circularPoints = generateRegularPolygon(
          center: LatLng(locationPositionData.positionLat.toDouble(),
              locationPositionData.positionLng.toDouble()),
          radius: geoFenceValuesData.polygonRadius,
          sides: 360,
        );
        geoFenceValuesData.circularPoints = circularPoints;
        geoFenceValuesData.isItForRadius = true;
        emit(
          SetGeoFenceDataSettingAttendanceState.success(
            geoFenceValuesData: geoFenceValuesData,
          ),
        );
      } else {
        List<LatLng> polygonPoints = generateRegularPolygon(
          center: LatLng(locationPositionData.positionLat.toDouble(),
              locationPositionData.positionLng.toDouble()),
          radius: geoFenceValuesData.polygonRadius,
          sides: 4,
        );
        geoFenceValuesData.polygonPoints = polygonPoints;
        geoFenceValuesData.isItForRadius = false;
        emit(
          SetGeoFenceDataSettingAttendanceState.success(
            geoFenceValuesData: geoFenceValuesData,
          ),
        );
      }
    });
    on<GetLocationAddressAttendanceEvent>((event, emit) async {
      String address = event.address;
      if (address.isNotEmpty) {
        emit(
          GeoLocationAddressAttendanceState.init(),
        );
        Either<FailureResponse, HereLocationModel> autoCompleteRequest =
            await hereGeoLocationRepo.hereAutoCompleteRepoRequest(
          location: address,
        );
        if (autoCompleteRequest.isRight) {
          hereLocation = autoCompleteRequest.right;
          emit(
            GeoLocationAddressAttendanceState.success(
              hereLocation: hereLocation!,
            ),
          );
        } else {
          emit(
            GeoLocationAddressAttendanceState.success(
              hereLocation: hereLocation!,
            ),
          );
        }
      }
    });
    on<GetLocationPositionAttendanceEvent>((event, emit) async {
      String address = event.address;
      bool useCurrentLocation = event.useCurrentLocation;
      if (address.isNotEmpty) {
        emit(
          GeoLocationPositionAttendanceState.loading(),
        );
        if (useCurrentLocation) {
          locationPositionData = event.locationPositionData!;
          emit(
            GeoLocationPositionAttendanceState.success(
              herePosition: hereLocation,
              locationPositionData: locationPositionData,
            ),
          );
        } else {
          Either<FailureResponse, HereLocationModel> geoCodeRequest =
              await hereGeoLocationRepo.hereGeoCodeRepoRequest(
            location: address,
          );
          if (geoCodeRequest.isRight) {
            hereLocation = geoCodeRequest.right;
            locationPositionData = LocationPositionData(
              location: address,
              positionLat: hereLocation!.items.first.position!.lat,
              positionLng: hereLocation!.items.first.position!.lng,
            );
            debugPrint(
                'here is it from the logic $hereLocation $locationPositionData');
            emit(
              GeoLocationPositionAttendanceState.success(
                herePosition: hereLocation!,
                locationPositionData: locationPositionData,
              ),
            );
          } else {
            emit(
              GeoLocationPositionAttendanceState.failure(
                herePosition: hereLocation!,
                locationPositionData: locationPositionData,
              ),
            );
          }
        }
      }
    });
  }

  List<LatLng> generateRegularPolygon({
    required LatLng center,
    required double radius,
    required int sides,
  }) {
    List<LatLng> points = [];
    double angleStep = 2 * pi / sides;
    double radiusInDegrees = radius / 111320;

    for (int i = 0; i < sides; i++) {
      double angle = angleStep * i;

      double latOffset = radiusInDegrees * cos(angle);
      debugPrint(
          'this is the first latoffset $latOffset $i $angleStep $radius $radiusInDegrees');

      double lonOffset =
          (radius / (111320 * cos(center.latitude * pi / 180))) * sin(angle);

      debugPrint('this is the first lonOffset $lonOffset $i');

      LatLng point = LatLng(
        center.latitude + latOffset,
        center.longitude + lonOffset,
      );
      points.add(point);
    }
    points.add(points[0]);
    return points;
  }
}
