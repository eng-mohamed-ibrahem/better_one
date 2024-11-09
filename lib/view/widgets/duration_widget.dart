import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return Column(
      children: [
        duration.inMinutes == 0 && duration.inHours == 0
            ? const SizedBox.shrink()
            : Transform.translate(
                offset: Offset(-10.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    duration.inHours == 0
                        ? const SizedBox.shrink()
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(duration.inHours.toString(), style: style),
                              SizedBox(width: 4.w),
                              Text('time.hours'.tr(), style: style),
                            ],
                          ),
                    SizedBox(width: 10.w),
                    Text(
                        NumberFormat.decimalPattern(context.locale.countryCode)
                            .format(duration.inMinutes.remainder(60)),
                        style: style),
                    SizedBox(width: 4.w),
                    Text('time.minutes'.tr(), style: style),
                  ],
                ),
              ),
        Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(duration.inSeconds.remainder(60).toString(), style: style),
              SizedBox(width: 4.w),
              Text('time.seconds'.tr(), style: style),
            ],
          ),
        ),
      ],
    );
  }
}
