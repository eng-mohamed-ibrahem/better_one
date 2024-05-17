import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
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
          child: BackButtonl10n(),
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
                        height: AppMetrices.verticalGap,
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
                        height: AppMetrices.verticalGap,
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
                        height: AppMetrices.verticalGap,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: AppMetrices.verticalGap3,
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
                  Navigator.pushReplacementNamed(
                    context,
                    GenerateRouter.accountSettingScreen,
                    arguments: 'setting.account.title'.tr(),
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoginLoading) {
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
            ),
            const SizedBox(
              height: AppMetrices.verticalGap2,
            ),
            const Divider(
              indent: 5,
              endIndent: 5,
            ),
            const SizedBox(
              height: AppMetrices.verticalGap2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'setting.account.no_account'.tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, GenerateRouter.signup);
                  },
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                    ),
                    // padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      'auth.signup'.tr(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppMetrices.verticalGap3,
            ),
          ],
        ),
      ),
    );
  }
}
