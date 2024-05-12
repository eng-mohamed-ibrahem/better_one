import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/snack_bar/snack_bar.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LoginState();
}

class _LoginState extends State<LogIn> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('auth.access_account'.tr()),
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonLl10n(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Form(
                key: _globalFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(AppMetrices.padding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: AppMetrices.heightSpace3,
            ),
            BlocConsumer<AuthViewmodel, AuthViewmodelState>(
              listener: (context, state) {
                if (state.isLoginFailed) {
                  showSnackBar(context, message: state.errorMessage!);
                }
                if (state.isLoginSuccess) {
                  showSnackBar(context, message: 'auth.login_succ'.tr());
                  userLocaleDatabase.setUserDataToLocale(
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
                      AuthViewmodel.get(context)
                          .login(email: email.text, password: password.text);
                    }
                  },
                  child: Text(
                    'auth.login'.tr(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
