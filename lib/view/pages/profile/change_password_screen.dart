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

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
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
          "profile.change_password.title".tr(),
        ),
      ),
      body: BlocConsumer<UserViewmodel, UserViewmodelState>(
        listener: (context, state) {
          state.whenOrNull(
            changePasswordSuccess: (user) {
              showSnackBar(context,
                  message: "profile.change_password.success".tr());
              context.read<UserViewmodel>().getUserDetails();
              context.goNamed(Routes.profile.name);
            },
            changePasswordFailed: (message) {
              // pop the loading dialog
              context.pop();
              showSnackBar(context, message: message);
            },
            changePasswordLoading: () {
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
                          "profile.change_password.new_pass".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap.h,
                        ),
                        AuthField(
                          controller: newPasswordController,
                          validator: Validators.validatePassword,
                          textInputAction: TextInputAction.next,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap.h,
                        ),
                        Text(
                          "profile.change_password.new_pass_confirm".tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(
                          height: AppMetrices.verticalGap.h,
                        ),
                        AuthField(
                          controller: confirmNewPasswordController,
                          validator: (value) {
                            if (value != newPasswordController.text.trim()) {
                              return "profile.change_password.invalid.confirm_new_pass"
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
                            .changePassword(newPasswordController.text);
                      }
                    },
                    child:
                        const Text("profile.change_password.confirm_pass").tr(),
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
