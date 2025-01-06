import 'package:flutter/widgets.dart';

class AppBodyPaddingWidget extends StatelessWidget {
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;
  final EdgeInsets? padding;
  const AppBodyPaddingWidget({
    super.key,
    required this.child,
    this.horizontalPadding = 0,
    this.verticalPadding = 0,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: verticalPadding,
            horizontal: horizontalPadding,
          ),
      child: child,
    );
  }
}
