import 'package:flutter/material.dart';
import 'package:geoattend/app/config/appColors/app_colors.dart';

class DialogMessageWidget extends StatelessWidget {
  final String dialogMessage;
  final String title;
  final String actionBtnLabel;
  final Color titleColor;
  final VoidCallback okayFunctionality;
  const DialogMessageWidget({
    super.key,
    required this.dialogMessage,
    required this.okayFunctionality,
    required this.title,
    this.titleColor = AppColors.primaryColor,
    this.actionBtnLabel = 'Okay',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 18.0,
          fontWeight: FontWeight.w700,
        ),
      ),
      content: Text(
        dialogMessage,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: okayFunctionality,
          child: Text(
            actionBtnLabel,
            style: const TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
