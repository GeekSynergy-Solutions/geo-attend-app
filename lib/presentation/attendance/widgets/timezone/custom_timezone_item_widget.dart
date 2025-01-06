import 'package:flutter/material.dart';

class CustomTimezoneItemWidget extends StatelessWidget {
  final String timezone;
  final String utcDifference;
  final VoidCallback functionality;
  const CustomTimezoneItemWidget({
    super.key,
    required this.timezone,
    required this.utcDifference,
    required this.functionality,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: functionality,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Text(timezone),
            Expanded(
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Text('UTC $utcDifference'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
