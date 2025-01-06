import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';
import 'package:geoattend/infrastructure/util/reusableWidgets/appSpacer/app_spacer_widget.dart';

double height = 48.18;

class TextFieldHeaderWidget extends StatelessWidget {
  final String title;
  final Widget child;
  final bool maintainDefaultHeight;
  final bool isThereAnError;
  final double increaseBy;
  final bool allowBottomPadding;
  final bool hasMultipleChidrenFields;
  final bool allowTopSpacing;
  final double bottomPaddingWhenTitleIsEmpty;
  final Widget? widgetAlongSideTitle;
  const TextFieldHeaderWidget({
    super.key,
    required this.child,
    required this.title,
    required this.isThereAnError,
    this.maintainDefaultHeight = true,
    this.increaseBy = 1,
    this.allowBottomPadding = true,
    this.hasMultipleChidrenFields = false,
    this.allowTopSpacing = false,
    this.bottomPaddingWhenTitleIsEmpty = 10.0,
    this.widgetAlongSideTitle
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: title.isEmpty
            ? bottomPaddingWhenTitleIsEmpty
            : allowBottomPadding
                ? 20.0
                : 0.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Row(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textFieldLabelColor,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: widgetAlongSideTitle,
                  ),
                ),
              ],
            ),
          if (title.isNotEmpty)
            const AppSpacerWidget(
              height: 8.0,
            ),
          SizedBox(
            height: hasMultipleChidrenFields
                ? null
                : maintainDefaultHeight
                    ? isThereAnError
                        ? height * 1.5 * increaseBy
                        : height
                    : null,
            width: double.infinity,
            child: child,
          ),
        ],
      ),
    );
  }
}
