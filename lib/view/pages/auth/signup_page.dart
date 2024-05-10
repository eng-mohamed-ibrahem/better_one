import 'package:better_one/core/constants/app_metrices.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/snack_bar/snack_bar.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth.cr_account'.tr()),
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonLl10n(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppMetrices.borderRadius1),
        child: Card(
          child: Form(
            key: _globalFormKey,
            child: Column(
              children: [
                AuthField(
                  controller: userName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'auth.required.name'.tr();
                    }
                    return null;
                  },
                  hintText: 'auth.u_name'.tr(),
                  labelText: 'auth.u_name'.tr(),
                ),
                const SizedBox(
                  height: AppMetrices.heightSpace,
                ),
                AuthField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'auth.required.email'.tr();
                    }
                    return null;
                  },
                  hintText: 'auth.u_email'.tr(),
                  labelText: 'auth.u_email'.tr(),
                ),
                const SizedBox(
                  height: AppMetrices.heightSpace,
                ),
                AuthField(
                  controller: password,
                  isItPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'auth.required.pass'.tr();
                    }
                    return null;
                  },
                  hintText: 'auth.u_pass'.tr(),
                  labelText: 'auth.u_pass'.tr(),
                ),
                const SizedBox(
                  height: AppMetrices.heightSpace,
                ),
                AuthField(
                  controller: confirmPassword,
                  isItPassword: true,
                  validator: (value) {
                    if (confirmPassword.text != password.text) {
                      return 'auth.required.confirm_pass'.tr();
                    }
                    return null;
                  },
                  hintText: 'auth.confirm_u_pass'.tr(),
                  labelText: 'auth.confirm_u_pass'.tr(),
                ),
                Expanded(
                  child: BlocConsumer<AuthViewmodel, AuthViewmodelState>(
                    listener: (context, state) {
                      if (state.isSignupFailed) {
                        showSnackBar(context, message: state.errorMessage!);
                      }
                      if (state.isSignupSuccess) {
                        showSnackBar(context, message: 'auth.signup_succ'.tr());
                        userLocalDatabase.setUserDataToLocal(
                          user: state.userModel!.toJson(),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.isSignupLoading) {
                        return const CircularProgressIndicator();
                      }
                      return FilledButton(
                        onPressed: () {
                          if (_globalFormKey.currentState!.validate()) {
                            AuthViewmodel.get(context).signup(
                                email: email.text, password: password.text);
                          }
                        },
                        child: Text(
                          'auth.signup'.tr(),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
