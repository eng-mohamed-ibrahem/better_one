import 'package:flutter/material.dart';

class DurationTime extends StatelessWidget {
  const DurationTime({
    super.key,
    required this.duration,
  });
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          children: [
            Text(duration.inHours.toString().padLeft(2, '0')),
            const Text('hour'),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(duration.inMinutes.remainder(60).toString().padLeft(2, '0')),
            const Text('minute'),
          ],
        ),
        const SizedBox(width: 10),
        Column(
          children: [
            Text(duration.inSeconds.remainder(60).toString().padLeft(2, '0')),
            const Text('second'),
          ],
        ),
      ],
    );
  }
}
