import 'package:flutter/material.dart';

showSheet(BuildContext context, {required Widget content}) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    enableDrag: true,
    constraints:
        BoxConstraints(maxHeight: MediaQuery.sizeOf(context).height * .3),
    builder: (context) {
      return content;
    },
  );
}
