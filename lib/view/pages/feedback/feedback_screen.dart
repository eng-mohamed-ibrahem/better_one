import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/model/feedback_model/feedback_model.dart';
import 'package:better_one/view_models/feedback_viewmodel/feedback_viewmodel.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
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
                context.goNamed(Routes.settings.name);
              },
              sendFeedbackLoading: () {
                showLoadingDialog(context);
              },
            );
          },
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: AppMetrices.verticalGap3.h),
                Text(
                  'feedback.subtitle'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: AppMetrices.verticalGap2.h),
                //create emojis represent the feedback rating from 1 to 5
                Row(
                  children: [
                    Text('feedback.emoji_1'.tr()),
                    SizedBox(width: 10.w),
                    Text('feedback.emoji_2'.tr()),
                    SizedBox(width: 10.w),
                    Text('feedback.emoji_3'.tr()),
                    SizedBox(width: 10.w),
                    Text('feedback.emoji_4'.tr()),
                    SizedBox(width: 10.w),
                    Text('feedback.emoji_5'.tr()),
                  ],
                ),
                SizedBox(height: AppMetrices.verticalGap3.h),
                // text field to enter your feedback
                Text(
                  'feedback.subtitle'.tr(),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Container(
                  padding: EdgeInsets.all(10.w),
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  child: TextField(
                    controller: feedbackController,
                    minLines: 5,
                    maxLength: null,
                    decoration: InputDecoration(
                      labelText: 'feedback.hint'.tr(),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          if (feedbackController.text.isEmpty) {
            showSnackBar(context, message: 'feedback.required'.tr());
            return;
          }
          var user = context.read<UserViewmodel>().currentUser;
          var feedback = FeedbackModel(
            feedback: feedbackController.text,
            userName: user.name,
            dateTime: DateTime.now(),
            userId: user.id,
            email: user.email,
            // attachmentUrl: "",
            // emojiRate: "0",
          );
          context.read<FeedbackViewmodel>().sendFeedback(feedback);
        },
        child: Text('feedback.send'.tr()),
      ),
    );
  }
}
