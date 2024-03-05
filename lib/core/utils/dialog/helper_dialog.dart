import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constants.dart';

/// dialog for complete task
void showCompleteTaskDialog(
    BuildContext context, AnimationController controller) {
  showDialog(
    context: context,
    builder: (context) {
      return Lottie.asset(
        LottieAssets.celebration,
        fit: BoxFit.cover,
        repeat: true,
        controller: controller,
      );
    },
  );
  // remove dialog after the animation complete
  controller.addListener(() {
    if (controller.isCompleted) {
      controller.stop();
      Navigator.pop(context);
    }
  });
}

/// dialog for delete task
void showDeleteTaskDialog(BuildContext context,
    {required String message, VoidCallback? onConfirm}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('task.delete'.tr(),
            style: Theme.of(context).textTheme.titleLarge),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('core.cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.pop(context);
            },
            child: Text(
              'task.confirm_delete'.tr(),
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: AppColors.hightlightColor,
                  ),
            ),
          ),
        ],
      );
    },
  );
}
