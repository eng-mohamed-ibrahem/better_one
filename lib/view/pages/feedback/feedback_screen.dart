import 'dart:io';

import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/enum/feedback_cat_enum.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/model/feedback_model/feedback_model.dart';
import 'package:better_one/view_models/feedback_viewmodel/feedback_viewmodel.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController feedbackController = TextEditingController();
  FeedbackCatEnum feedbackCat = FeedbackCatEnum.technical;
  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FittedBox(
          child: BackButtonl10n(),
        ),
        title: Text('feedback.title'.tr()),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.h),
          child: Hero(
            transitionOnUserGestures: true,
            tag: 'feedback',
            child: Text(
              'feedback.subtitle'.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: BlocConsumer<FeedbackViewmodel, FeedbackViewmodelState>(
          listener: (context, state) {
            state.whenOrNull(
              sendFeedbackFailed: (message, failure) {
                showSnackBar(context, message: message);
                context.pop(context);
              },
              sendFeedbackSuccess: () {
                showSnackBar(context, message: 'feedback.success'.tr());
                context.goNamed(Routes.profile.name);
              },
              sendFeedbackLoading: () {
                showLoadingDialog(context);
              },
            );
          },
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: AppMetrices.verticalGap2.h),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Wrap(
                      spacing: 10.w,
                      runSpacing: 10.w,
                      children: List.generate(
                        FeedbackCatEnum.values.length,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                feedbackCat = FeedbackCatEnum.values[index];
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 5.h,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AbsorbPointer(
                                    child: Radio(
                                      value: FeedbackCatEnum.values[index],
                                      groupValue: feedbackCat,
                                      onChanged: (_) {},
                                    ),
                                  ),
                                  Text(
                                    "feedback.cat.${FeedbackCatEnum.values[index].name}"
                                        .tr(),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: AppMetrices.verticalGap3.h),
                // text field to enter your feedback
                Text(
                  'feedback.hint'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  padding: EdgeInsets.all(10.w),
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).shadowColor,
                    ),
                  ),
                  child: TextField(
                    controller: feedbackController,
                    minLines: 5,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'feedback.hint'.tr(),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
                SizedBox(height: 60.h),
                Center(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      minimumSize:
                          Size(MediaQuery.sizeOf(context).width * .6, 40.h),
                    ),
                    onPressed: () async {
                      if (feedbackController.text.isEmpty) {
                        showSnackBar(context,
                            message: 'feedback.required'.tr());
                        return;
                      }
                      // var user = context.read<UserViewmodel>().currentUser;
                      var user = inject<LocaleUserInfo>().getUserData()!;
                      var feedback = FeedbackModel(
                        feedbackCat: feedbackCat,
                        feedback: feedbackController.text,
                        userName: user.name,
                        timeStamp: DateTime.now(),
                        userId: user.id,
                        email: user.email,
                        deviceInfo: await _deviceInfo,
                        // attachmentUrl: "",
                      );
                      context.read<FeedbackViewmodel>().sendFeedback(feedback);
                    },
                    child: Text('feedback.send'.tr()),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<DeviceInfo?> get _deviceInfo async {
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      return DeviceInfo(
        deviceName: androidInfo.device,
        deviceModel: androidInfo.model,
        deviceOs: "android",
        deviceOsVersion: androidInfo.version.release,
      );
    }
    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      return DeviceInfo(
        deviceName: iosInfo.utsname.machine,
        deviceModel: iosInfo.model,
        deviceOs: "ios",
        deviceOsVersion: iosInfo.systemVersion,
      );
    }
    return null;
  }
}
