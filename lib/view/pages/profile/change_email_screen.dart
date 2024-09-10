import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  final TextEditingController oldEmailController = TextEditingController();
  final TextEditingController newEmailController = TextEditingController();
  final TextEditingController confirmNewEmailController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    oldEmailController.text = context.read<UserViewmodel>().currentUser.email;
    super.initState();
  }

  @override
  void dispose() {
    oldEmailController.dispose();
    newEmailController.dispose();
    confirmNewEmailController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FittedBox(
          child: BackButtonl10n(),
        ),
        title: Text(
          "profile.change_email.title".tr(),
        ),
      ),
      body: BlocConsumer<UserViewmodel, UserViewmodelState>(
        listener: (context, state) {
          state.whenOrNull(
            changeEmailSuccess: (user) {
              showSnackBar(context,
                  message: "profile.change_email.success".tr());
              context.goNamed(Routes.profile.name);
            },
            changeEmailFailed: (message) {
              // pop the loading dialog
              context.pop();
              showSnackBar(context, message: message);
            },
            changeEmailLoading: () {
              showLoadingDialog(context);
            },
          );
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppMetrices.verticalGap3.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppMetrices.borderRadius1),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor,
                        spreadRadius: 1,
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppMetrices.horizontalGap.w,
                    vertical: AppMetrices.verticalGap.h,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: AppMetrices.horizontalGap.w,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "profile.change_email.old_email".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap.h,
                        ),
                        AuthField(
                          readOnly: true,
                          controller: oldEmailController,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap2.h,
                        ),
                        Text(
                          "profile.change_email.new_email".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap.h,
                        ),
                        AuthField(
                          controller: newEmailController,
                          validator: Validators.validateEmail,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap2.h,
                        ),
                        Text(
                          "profile.change_email.new_email_confirm".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap.h,
                        ),
                        AuthField(
                          controller: confirmNewEmailController,
                          validator: (value) {
                            if (value != newEmailController.text) {
                              return "profile.change_email.invalid.confirm_new_email"
                                  .tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap.h,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: AppMetrices.verticalGap3.h,
                ),
                Container(
                  constraints: BoxConstraints(
                    minWidth: MediaQuery.of(context).size.width * 0.5,
                  ),
                  child: FilledButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context
                            .read<UserViewmodel>()
                            .changeEmail(newEmailController.text.trim());
                      }
                    },
                    child:
                        const Text("profile.change_email.confirm_email").tr(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
