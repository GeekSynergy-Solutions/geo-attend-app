import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geoattend/domain/entity/response/failure/failure_response.dart';
import 'package:geoattend/infrastructure/util/generalConstantValues/general_constant_values.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

late Position currentPosition;

class CurrentLatLngAddressModel extends Equatable {
  final String address;
  final Position latlng;
  const CurrentLatLngAddressModel(
      {required this.address, required this.latlng});

  @override
  List<Object?> get props => [address, latlng];
}

class AddressModel extends Equatable {
  final String address;
  final bool status;
  const AddressModel({required this.address, required this.status});

  @override
  List<Object?> get props => [address, status];
}

class GetCurrentLocation {
  static bool isThereErrorWhilePickingLocation = false;

  static Future<Either<FailureResponse, CurrentLatLngAddressModel>>
      getCurrentPosition({required BuildContext context}) async {
    final isPermissionGranted = await checkLocationPermission();
    String currentAddress = '';
    bool successState = false;

    if (isPermissionGranted == true) {
      await Geolocator.getCurrentPosition().then((Position position) async {
        currentPosition = position;
        if (context.mounted) {
          AddressModel response =
              await getAddressFromPositionLatLng(context: context);
          currentAddress = response.address;
          successState = response.status;
        }
      }).catchError((e) {
        successState = false;
      });
      return successState
          ? Right(
              CurrentLatLngAddressModel(
                  address: currentAddress, latlng: currentPosition),
            )
          : Left(
              FailureResponse(
                errorMessage: 'Unable to get your current location',
                statusCode: 0,
              ),
            );
    } else {
      return Left(
        FailureResponse(
          errorMessage:
              'Location permissions are permanently denied, we cannot request permissions.\n\nPlease enable location.',
          statusCode: GeneralConstantValues.locationPermissionDeniedForever,
        ),
      );
    }
  }

  static Future<bool> checkIfUserLocationIsEnable() async {
    bool isItPermissionGranted = false;
    LocationPermission locationPermission = await Geolocator.checkPermission();

    // LocationPermission locationStatus = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      isItPermissionGranted = false;
    } else {
      isItPermissionGranted = true;
    }
    return isItPermissionGranted;
  }

  static Future<bool> checkLocationPermission() async {
    bool isItPermissionGranted = await checkIfUserLocationIsEnable();
    // bool serviceEnabled;
    late LocationPermission locationPermission;

    // LocationPermission locationStatus = await Geolocator.checkPermission();
    if (!isItPermissionGranted) {
      try {
        locationPermission = await Geolocator.requestPermission();

        while (locationPermission == LocationPermission.denied) {
          locationPermission = await Geolocator.requestPermission();
        }
        if (locationPermission == LocationPermission.denied ||
            locationPermission == LocationPermission.deniedForever) {
          isItPermissionGranted = false;
        } else {
          isItPermissionGranted = true;
        }
      } catch (e) {
        isItPermissionGranted = false;
      }
    }

    return isItPermissionGranted;
  }

  static Future<AddressModel> getAddressFromPositionLatLng(
      {required BuildContext context}) async {
    String latLngAddress = '';
    late AddressModel response;
    await placemarkFromCoordinates(
            currentPosition.latitude, currentPosition.longitude)
        .then((List<Placemark> placemarks) {
      Placemark placemark = placemarks[0];
      latLngAddress =
          "${placemark.street}, ${placemark.locality} ${placemark.country}";
      response = AddressModel(address: latLngAddress, status: true);
    }).catchError((e) {
      response = const AddressModel(
          address: 'Unable to get your current location', status: false);
    });
    return response;
  }
}
