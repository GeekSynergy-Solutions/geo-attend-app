import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/domain/entity/objectData/geoFenceTypeData/geo_fence_values_data.dart';
import 'package:geoattend/domain/entity/objectData/locationPositionData/location_position_data.dart';
import 'package:geoattend/domain/entity/objectData/mapTileData/map_tile_data.dart';
import 'package:geoattend/infrastructure/api/apiEndpoints/api_end_points.dart';
import 'package:geoattend/presentation/attendance/bloc/attendance_bloc.dart';
import 'package:geoattend/presentation/attendance/bloc/state/attendance_state.dart';
import 'package:latlong2/latlong.dart';

class SetUpGeoFenceMapWidget extends StatefulWidget {
  final LocationPositionData locationData;
  const SetUpGeoFenceMapWidget({super.key, required this.locationData});

  @override
  State<SetUpGeoFenceMapWidget> createState() => _SetUpGeoFenceMapWidgetState();
}

class _SetUpGeoFenceMapWidgetState extends State<SetUpGeoFenceMapWidget> {
  bool useOpenStreetMap = true;

  late LocationPositionData locationData;

  bool setLocation = false;

  MapController mapController = MapController();

  late LatLng initialPosition;

  late LatLng markerPosition;

  GeoFenceValuesData geoFenceValuesData = GeoFenceValuesData();
  bool isGeoFenceSettingSet = false;
  bool isGeoFenceOfTypeRadius = false;

  MapTileData mapTileData = MapTileData();

  @override
  void initState() {
    locationData = widget.locationData;
    LatLng givenLatLng = LatLng(locationData.positionLat.toDouble(),
        locationData.positionLng.toDouble());
    initialPosition = givenLatLng;
    markerPosition = givenLatLng;
    mapTileData = getTileCoordinates(
        latitude: initialPosition.latitude,
        longitude: initialPosition.longitude);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AttendanceBloc, AttendanceState>(
      builder: (context, state) {
        if (state is GeoLocationPositionAttendanceState) {
          if (!state.loadingData) {
            locationData = state.locationPositionData ?? locationData;
            markerPosition = LatLng(locationData.positionLat.toDouble(),
                locationData.positionLng.toDouble());
            initialPosition = LatLng(locationData.positionLat.toDouble(),
                locationData.positionLng.toDouble());
            mapTileData = getTileCoordinates(
              latitude: initialPosition.latitude,
              longitude: initialPosition.longitude,
            );
            setLocation = state.setLocation;
            debugPrint(
                'here is the marker $markerPosition initialPosition $initialPosition $setLocation');
          }
        }
        if (state is SetGeoFenceDataSettingAttendanceState) {
          isGeoFenceSettingSet = state.geoFenceDataSet;
          if (isGeoFenceSettingSet) {
            geoFenceValuesData = state.geoFenceValuesData;
            isGeoFenceOfTypeRadius = geoFenceValuesData.isItForRadius;
          } else {
            setLocation = isGeoFenceSettingSet;
          }
        }
        return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: initialPosition,
            initialZoom: 18.0,
            onMapReady: () {
              mapController.move(markerPosition, 18.0);
            },
          ),
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.geoMapTileColor.withOpacity(0.4),
              ),
              child: TileLayer(
                urlTemplate: useOpenStreetMap
                    ? 'https://a.tile.openstreetmap.org/${mapTileData.z}/${mapTileData.x}/${mapTileData.y}.png'
                    : 'https://api.maptiler.com/maps/basic/${mapTileData.z}/${mapTileData.x}/${mapTileData.y}.png?key=${APIEndPoints.mapTilerApiKey}',
              ),
            ),
            if (isGeoFenceSettingSet)
              PolygonLayer(
                polygons: [
                  Polygon(
                    points: geoFenceValuesData.isItForRadius
                        ? geoFenceValuesData.circularPoints
                        : geoFenceValuesData.polygonPoints,
                    borderColor: AppColors.locationMarkerColor,
                    color: AppColors.locationMarkerColor.withOpacity(0.5),
                    borderStrokeWidth: 2.0,
                  ),
                ],
              ),
            MarkerLayer(
              markers: [
                if (setLocation)
                  Marker(
                    width: 20.0,
                    height: 20.0,
                    point: markerPosition,
                    child: Center(
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.locationMarkerColor,
                        ),
                      ),
                    ),
                  ),
                // Marker(
                //   width: isGeoFenceSettingSet && isGeoFenceOfTypeRadius
                //       ? 80.0
                //       : 20.0,
                //   height: isGeoFenceSettingSet && isGeoFenceOfTypeRadius
                //       ? 80.0
                //       : 20.0,
                //   point: markerPosition,
                //   child: isGeoFenceSettingSet && isGeoFenceOfTypeRadius
                //       ? Container(
                //           width: 20 * geoFenceValuesData.circularRadius,
                //           height: 20 * geoFenceValuesData.circularRadius,
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: AppColors.locationMarkerColor
                //                 .withOpacity(0.5),
                //           ),
                //           child: Center(
                //             child: Container(
                //               height: 20,
                //               width: 20,
                //               decoration: const BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: AppColors.locationMarkerColor,
                //               ),
                //             ),
                //           ),
                //         )
                //       : Center(
                //           child: Container(
                //             height: 20,
                //             width: 20,
                //             decoration: const BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: AppColors.locationMarkerColor,
                //             ),
                //           ),
                //         ),
                // ),
              ],
            ),
          ],
        );
      },
    );
  }

  MapTileData getTileCoordinates(
      {required double latitude, required double longitude, int zoom = 11}) {
    double latRad = latitude * pi / 180.0;

    int x = ((longitude + 180.0) / 360.0 * pow(2, zoom)).floor();
    int y = ((1 - log(tan(latRad) + 1 / cos(latRad)) / pi) / 2 * pow(2, zoom))
        .floor();

    return MapTileData(x: x, y: y, z: zoom);
  }
}
