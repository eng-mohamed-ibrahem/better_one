import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BackButtonLl10n extends StatelessWidget {
  const BackButtonLl10n({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        context.locale == const Locale('en')
            ? Icons.keyboard_double_arrow_left_rounded
            : Icons.keyboard_double_arrow_right_rounded,
        size: 25,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
