import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class HomeUserProfileWidget extends StatelessWidget {
  final String userFirstName;
  final Color userBgColor;
  final String userInitial;
  final String greeting;
  const HomeUserProfileWidget({
    super.key,
    required this.greeting,
    required this.userFirstName,
    required this.userBgColor,
    required this.userInitial,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: userBgColor,
                ),
                child: Center(
                  child: Text(
                    userInitial,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: userBgColor == AppColors.whiteTextColor
                          ? AppColors.blackTextColor
                          : AppColors.whiteTextColor,
                    ),
                  ),
                ),
              ),
              const AppSpacerWidget(
                width: 5.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello, $userFirstName!',
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.homeUserProfileNameColor,
                    ),
                  ),
                  const AppSpacerWidget(
                    height: 2.5,
                  ),
                  FittedBox(
                    child: Text(
                      greeting,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.homeUserProfileNameColor,
                      ),
                    ),
                  ),
                ],
              ),
              const AppSpacerWidget(
                width: 10.0,
              ),
              // Expanded(
              //   child: Align(
              //     alignment: AlignmentDirectional.topEnd,
              //     child: actionItemWidget(
              //       functionality: () {},
              //       imagePath: AppImagePath.notificationItemSvg,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget actionItemWidget(
      {required String imagePath, required VoidCallback functionality}) {
    return InkWell(
      onTap: functionality,
      child: Container(
        width: 37.68,
        height: 37.68,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.homeActionItemBgColor,
        ),
        child: Center(
          child: SvgPicture.asset(imagePath),
        ),
      ),
    );
  }
}
