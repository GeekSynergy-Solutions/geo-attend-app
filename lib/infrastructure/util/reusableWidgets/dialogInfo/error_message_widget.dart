import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String message;
  final String? actionLabel;
  final VoidCallback? functionality;
  const ErrorMessageWidget({
    super.key,
    required this.message,
    this.actionLabel,
    this.functionality,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 12.0,
      ),
      backgroundColor:  AppColors.redColor,
      contentPadding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        right: 20.0,
        bottom: 10.0,
      ),
      content: Builder(
        builder: (context) {
          return FittedBox(
            child: SizedBox(
              height: 120,
              width: 348,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style: const TextStyle(
                              color:AppColors.whiteTextColor,
                              fontSize: 14.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const AppSpacerWidget(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: functionality ?? () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            actionLabel ?? 'Okay',
                            style: const TextStyle(
                              color: AppColors.whiteTextColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
