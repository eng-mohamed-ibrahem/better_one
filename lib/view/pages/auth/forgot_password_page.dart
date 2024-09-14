import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool sentCode = false;
  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth.forgot_password.title'.tr()),
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonl10n(),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<AuthViewmodel, AuthViewmodelState>(
          listener: (context, state) {
            state.whenOrNull(
              sendForgotPasswordSuccess: () {
                sentCode = true;
                context.pop();
                showSnackBar(context,
                    message: "auth.forgot_password.success".tr());
              },
              sendForgotPasswordFailed: (message) {
                context.pop();
                showSnackBar(context, message: message);
              },
              sendForgotPasswordLoading: () {
                showLoadingDialog(context);
              },
              verifyPasswordResetCodeSuccess: (_) {},
              verifyPasswordResetCodeFailed: (message) {
                context.pop();
                showSnackBar(context, message: message);
              },
            );
          },
          builder: (context, state) {
            return Form(
              key: formKey,
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
                    child: sentCode
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "auth.forgot_password.success".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: AppMetrices.verticalGap.h,
                              ),
                              TextFormField(
                                controller: codeController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "auth.forgot_password.required".tr();
                                  }
                                  if (!RegExp(r'^[0-9]{6}$').hasMatch(value)) {
                                    return "auth.forgot_password.invalid".tr();
                                  }
                                  return null;
                                },
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight,
                                    ),
                                decoration: InputDecoration(
                                  fillColor: Theme.of(context).shadowColor,
                                  filled: true,
                                  hintText:
                                      "auth.forgot_password.code_hint".tr(),
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                ),
                              ),
                              SizedBox(
                                height: AppMetrices.verticalGap.h,
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "auth.forgot_password.subtitle".tr(),
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: AppMetrices.verticalGap.h,
                              ),
                              AuthField(
                                controller: emailController,
                                validator: Validators.validateEmail,
                              ),
                              SizedBox(
                                height: AppMetrices.verticalGap.h,
                              ),
                            ],
                          ),
                  ),
                  SizedBox(
                    height: AppMetrices.verticalGap3.h,
                  ),
                  sentCode
                      ? TextButton.icon(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<AuthViewmodel>()
                                  .verifyPasswordResetCode(
                                    code: codeController.text.trim(),
                                  );
                            }
                          },
                          icon: state.whenOrNull(
                            verifyPasswordResetCodeLoading: () {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Theme.of(context).primaryColorLight,
                                  strokeWidth: 2,
                                ),
                              );
                            },
                          ),
                          label: Text('auth.forgot_password.verify'.tr()),
                        )
                      : TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size(
                              MediaQuery.sizeOf(context).width * 0.6,
                              40.h,
                            ),
                            textStyle: Theme.of(context).textTheme.bodyMedium,
                            backgroundColor: Theme.of(context).primaryColorDark,
                            elevation: 2,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthViewmodel>().sendForgotPassword(
                                    email: emailController.text.trim(),
                                  );
                            }
                          },
                          child: Text('auth.forgot_password.send'.tr()),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
