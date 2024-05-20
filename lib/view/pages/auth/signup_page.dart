import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/app_metrices.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
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
                        textInputAction: TextInputAction.next,
                        controller: userName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'auth.required.name'.tr();
                          }
                          return null;
                        },
                        labelText: 'auth.u_name'.tr(),
                      ),
                      const SizedBox(
                        height: AppMetrices.verticalGap2,
                      ),
                      AuthField(
                        textInputAction: TextInputAction.next,
                        controller: email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'auth.required.email'.tr();
                          }
                          return null;
                        },
                        labelText: 'auth.u_email'.tr(),
                      ),
                      const SizedBox(
                        height: AppMetrices.verticalGap2,
                      ),
                      AuthField(
                        textInputAction: TextInputAction.next,
                        controller: password,
                        isItPassword: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'auth.required.pass'.tr();
                          }
                          return null;
                        },
                        labelText: 'auth.u_pass'.tr(),
                      ),
                      const SizedBox(
                        height: AppMetrices.verticalGap2,
                      ),
                      AuthField(
                        textInputAction: TextInputAction.done,
                        controller: confirmPassword,
                        isItPassword: true,
                        validator: (value) {
                          if (confirmPassword.text != password.text) {
                            return 'auth.required.confirm_pass'.tr();
                          }
                          return null;
                        },
                        labelText: 'auth.confirm_u_pass'.tr(),
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
                if (state.isSignupFailed) {
                  showSnackBar(context, message: state.errorMessage!);
                }
                if (state.isSignupSuccess) {
                  showSnackBar(context, message: 'auth.signup_succ'.tr());
                  Navigator.pushReplacementNamed(
                    context,
                    GenerateRouter.login,
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
                          email: email.text,
                          password: password.text,
                          name: userName.text);
                    }
                  },
                  child: Text(
                    'auth.signup'.tr(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: AppMetrices.verticalGap2,
            ),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
                Text('setting.account.or'.tr()),
                const Expanded(
                  child: Divider(
                    indent: 5,
                    endIndent: 5,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppMetrices.verticalGap3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'setting.account.has_account'.tr(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, GenerateRouter.login);
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
                      'auth.login'.tr(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.blue,
                          ),
                    ),
                  ),
                ),
              ],
            ),

            // RichText(
            //   text: TextSpan(
            //     text: 'setting.account.has_account'.tr(),
            //     style: Theme.of(context).textTheme.bodySmall,
            //     children: [
            //       TextSpan(
            //         text: ' ${'auth.login'.tr()}',
            //         style: Theme.of(context).textTheme.bodySmall!.copyWith(
            //               color: Colors.blue,
            //             ),
            //         recognizer: TapGestureRecognizer()
            //           ..onTap = () {
            //             Navigator.pushReplacementNamed(
            //                 context, GenerateRouter.login);
            //           },
            //       ),
            //     ],
            //   ),
            // ),

            const SizedBox(
              height: AppMetrices.verticalGap3,
            ),
          ],
        ),
      ),
    );
  }
}
