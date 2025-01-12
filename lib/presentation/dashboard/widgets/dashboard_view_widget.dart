// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/app/config/appRouterHandler/app_router.dart';
import 'package:geoattend/domain/entity/objectData/successfulUserDataStatus/successful_user_data_status.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';

class DashboardViewWidget extends StatefulWidget {
  final SuccessfulUserDataStatus successfulUserDataStatus;
  const DashboardViewWidget({
    super.key,
    required this.successfulUserDataStatus,
  });

  @override
  State<DashboardViewWidget> createState() => _DashboardViewWidgetState();
}

class _DashboardViewWidgetState extends State<DashboardViewWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late SuccessfulUserDataStatus successfulUserDataStatus;
  int currentBottomIndex = 0;
  @override
  void initState() {
    successfulUserDataStatus = widget.successfulUserDataStatus;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: AutoTabsRouter(
        routes: [
          HomeRoute(successfulUserDataStatus: successfulUserDataStatus),
          AttendanceHistoryRoute(
              successfulUserDataStatus: successfulUserDataStatus),
          ProfileRoute(successfulUserDataStatus: successfulUserDataStatus),
        ],
        homeIndex: 0,
        transitionBuilder: (context, child, animation) {
          final navigationRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: FadeTransition(
              opacity: animation,
              child: child,
            ),
            bottomNavigationBar: Container(
              // height: 150.0,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.bottomNavBgColor,
              ),
              child: BottomAppBar(
                child: BottomNavigationBar(
                  backgroundColor: AppColors.bottomNavBgColor,
                  currentIndex: navigationRouter.activeIndex,
                  selectedItemColor: AppColors.selectedBottomNavItemColor,
                  unselectedItemColor: AppColors.unselectedBottomNavItemColor,
                  showSelectedLabels: true,
                  showUnselectedLabels: true,
                  iconSize: 25.0,
                  type: BottomNavigationBarType.fixed,
                  elevation: 0.0,
                  onTap: (index) {
                    // if (successfulUserDataStatus.isUserAGuest) {
                    //   if (index == 0) {
                    //     navigationRouter.setActiveIndex(index);
                    //   }
                    // } else {
                    //   navigationRouter.setActiveIndex(index);
                    // }
                    navigationRouter.setActiveIndex(index);
                    setCurrentBottomIndex(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppImagePath.homeTabSvg,
                        color: getColorForCurrentTab(tabIndex: 0),
                      ),
                      label: AppStringConstants.homeTab,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppImagePath.attendanceHistoryTabSvg,
                        color: getColorForCurrentTab(tabIndex: 1),
                      ),
                      label: AppStringConstants.attendanceTab,
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        AppImagePath.profileTabSvg,
                        color: getColorForCurrentTab(tabIndex: 2),
                      ),
                      label: AppStringConstants.profileTab,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void setCurrentBottomIndex(int index) {
    setState(() {
      currentBottomIndex = index;
    });
  }

  Color getColorForCurrentTab({required int tabIndex}) {
    if (currentBottomIndex == tabIndex) {
      return AppColors.selectedBottomNavItemColor;
    } else {
      return AppColors.unselectedBottomNavItemColor;
    }
  }
}
