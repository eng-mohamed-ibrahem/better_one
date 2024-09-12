import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/model/settings_item_model/setting_item_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

void showSnackBar(
  BuildContext context, {
  required String message,
  SnackBarAction? action,
  Color? backgroundColor,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      action: action,
    ),
  );
}

List<SettingItemModel> generateSettingItems() {
  return [
    SettingItemModel(
      title: 'setting.language.title'.tr(),
      subTitle: 'setting.language.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.language,
      ),
    ),
    SettingItemModel(
      title: 'setting.theme.title'.tr(),
      subTitle: 'setting.theme.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.brightness_6,
      ),
    ),
    SettingItemModel(
      title: 'setting.notification.title'.tr(),
      subTitle: 'setting.notification.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.notifications,
      ),
      path: Routes.notificationSetting.name,
    ),
    SettingItemModel(
      title: 'setting.search.title'.tr(),
      subTitle: 'setting.search.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.search,
      ),
      path: Routes.searchSetting.name,
    ),
    // SettingItemModel(
    //   title: 'setting.feedback.title'.tr(),
    //   subTitle: 'setting.feedback.subtitle'.tr(),
    //   leadingIcon: const Icon(
    //     Icons.feedback,
    //   ),
    //   path: Routes.feedback.name,
    // ),
    SettingItemModel(
      title: 'setting.account.title'.tr(),
      subTitle: 'setting.account.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.person,
      ),
      path: Routes.profile.name,
    ),
  ];
}

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
      context.pop();
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
              context.pop();
            },
            child: Text('core.cancel'.tr()),
          ),
          TextButton(
            onPressed: () {
              onConfirm?.call();
              context.pop();
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

/// dialog for logout
void showLogoutDialog(BuildContext context, {required VoidCallback onConfirm}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('auth.logout'.tr(),
            style: Theme.of(context).textTheme.titleLarge),
        content: Text('auth.logout_msg'.tr()),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('core.cancel'.tr()),
          ),
          TextButton(
            onPressed: onConfirm,
            child: Text(
              'auth.logout'.tr(),
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

/// show loading dialog with progress indicator
void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          content: Container(
            color: Theme.of(context).primaryColor,
            height: MediaQuery.sizeOf(context).height * .15,
            width: MediaQuery.sizeOf(context).width * .4,
            child: const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      );
    },
  );
}

/// print while debugging only
///
///
///
///  another way
/// ```dart
/// assert(() {
///   print(message);
///   return true;
/// }());
/// ```
void kDebugPrint(String message) {
  if (kDebugMode) {
    print(message);
  }
}

/// show model bottom sheet
showSheet(BuildContext context, {required Widget content}) {
  showModalBottomSheet(
    context: context,
    isDismissible: true,
    isScrollControlled: true,
    enableDrag: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(AppMetrices.borderRadius1),
      ),
    ),
    constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * .15,
        minWidth: double.infinity),
    builder: (context) {
      return content;
    },
  );
}
