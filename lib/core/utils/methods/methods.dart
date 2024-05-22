import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/model/settings_item_model/setting_item_model.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

void showFeedback(BuildContext context) {
  BetterFeedback.of(context).show((userFeedback) {
    // todo check if he has account or not
    // if not, show dialog for register

    ///#things to upload
    /// 1: screenshots
    /// 2: text
    /// 3: device info
    /// 4: package info
    debugPrint(userFeedback.text);
  });
}

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
      path: GenerateRouter.languageSettingScreen,
    ),
    SettingItemModel(
      title: 'setting.theme.title'.tr(),
      subTitle: 'setting.theme.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.brightness_6,
      ),
      path: GenerateRouter.themeSettingScreen,
    ),
    SettingItemModel(
      title: 'setting.notification.title'.tr(),
      subTitle: 'setting.notification.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.notifications,
      ),
      path: GenerateRouter.notificationSettingScreen,
    ),
    SettingItemModel(
      title: 'setting.search.title'.tr(),
      subTitle: 'setting.search.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.search,
      ),
      path: GenerateRouter.searchSettingScreen,
    ),
    SettingItemModel(
      title: 'setting.feedback.title'.tr(),
      subTitle: 'setting.feedback.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.feedback,
      ),
    ),
    SettingItemModel(
      title: 'setting.account.title'.tr(),
      subTitle: 'setting.account.subtitle'.tr(),
      leadingIcon: const Icon(
        Icons.person,
      ),
      path: GenerateRouter.accountSettingScreen,
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
              Navigator.pop(context);
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
      return BlocConsumer<UserViewmodel, UserViewmodelState>(
        listener: (context, state) {
          if (!state.isLogoutLoading) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return PopScope(
            canPop: !state.isLogoutLoading,
            child: const AlertDialog(
              content: SizedBox(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
