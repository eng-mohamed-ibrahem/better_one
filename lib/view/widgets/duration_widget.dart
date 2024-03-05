import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DurationTime extends StatelessWidget {
  const DurationTime({
    super.key,
    required this.duration,
    this.style,
  });
  final Duration duration;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Text(duration.inHours.toString().padLeft(2, '0'), style: style),
            Text('time.hour'.tr(), style: style),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
                style: style),
            Text('time.minute'.tr(), style: style),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
                style: style),
            Text('time.second'.tr(), style: style),
          ],
        ),
      ],
    );
  }
}
