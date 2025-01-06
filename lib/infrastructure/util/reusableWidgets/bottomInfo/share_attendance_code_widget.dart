import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/appImagePath/app_image_path.dart';
import 'package:geoattend/infrastructure/util/appStringConstants/app_string_constants.dart';
import 'package:geoattend/infrastructure/util/generalFunctions/general_functions.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appButton/app_button_widget.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';
import 'package:share_plus/share_plus.dart';

class ShareAttendanceCodeWidget extends StatelessWidget {
  final String attendanceCode;
  const ShareAttendanceCodeWidget({
    super.key,
    required this.attendanceCode,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppSpacerWidget(
              height: 10.0,
            ),
            Align(
              alignment: AlignmentDirectional.topCenter,
              child: Text(
                AppStringConstants.shareAttndCodeLabel,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  color: AppColors.textDarkerColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const AppSpacerWidget(
              height: 10.0,
            ),
            Text(
              AppStringConstants.shareAttndCodeDes,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 10.0,
                color: AppColors.textLighterColor,
              ),
              textAlign: TextAlign.center,
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            Container(
              height: 40.0,
              width: double.infinity,
              padding: const EdgeInsets.all(
                10.0,
              ),
              decoration: BoxDecoration(
                color: AppColors.attndCodeCopyBgColor,
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    attendanceCode,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: AppColors.textDarkerColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: InkWell(
                        onTap: () async {
                          await Clipboard.setData(
                                  ClipboardData(text: attendanceCode))
                              .then((value) {
                            if (context.mounted) {
                              GeneralFunctions.showSuccessErrorInfoMessage(
                                message:
                                    'Attendance code: $attendanceCode copied successfully',
                                context: context,
                                successMessage: true,
                              );
                            }
                          });
                        },
                        child: const Icon(
                          Icons.copy,
                          color: AppColors.copyIconColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const AppSpacerWidget(
              height: 20.0,
            ),
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: AppButtonWidget(
                width: 200,
                appButtonFunctionality: () async {
                  await Share.share(
                      'Join the schedule attendance with $attendanceCode');
                },
                decoration: BoxDecoration(
                  color: AppColors.activeButtonBgColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImagePath.shareSvg),
                    const AppSpacerWidget(
                      width: 3.0,
                    ),
                    Text(
                      AppStringConstants.attndShareCodeLabel,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
