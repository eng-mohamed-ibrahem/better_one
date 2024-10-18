import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class SwitchDateTime extends StatefulWidget {
  const SwitchDateTime({super.key, required this.dateTime});
  final DateTime dateTime;

  @override
  State<SwitchDateTime> createState() => _SwitchDateTimeState();
}

class _SwitchDateTimeState extends State<SwitchDateTime> {
  bool isTimeago = true;

  @override
  void didChangeDependencies() {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isTimeago = !isTimeago;
        });
      },
      child: Text(
        isTimeago
            ? timeago.format(widget.dateTime,
                locale: context.locale.languageCode)
            : DateFormat.yMMMMEEEEd(
                context.locale.languageCode,
              ).add_jm().format(widget.dateTime),
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
