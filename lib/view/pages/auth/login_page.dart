import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/background_service/notification_background_service.dart';
import 'package:better_one/core/utils/background_service/tasks_background_service.dart';
import 'package:better_one/core/utils/cache_service/cach_interface/locale_user_info.dart';
import 'package:better_one/core/utils/dependency_locator/inject.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
            SizedBox(
              height: AppMetrices.verticalGap3.h,
            ),
            Card(
              shadowColor: Theme.of(context).shadowColor,
              elevation: 4,
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
                        textInputAction: TextInputAction.next,
                        prefixIcon: Icon(Icons.email_rounded,
                            color: Theme.of(context).iconTheme.color),
                        validator: Validators.validateEmail,
                        hintText: 'auth.u_email'.tr(),
                        labelText: 'auth.u_email'.tr(),
                      ),
                      SizedBox(
                        height: AppMetrices.verticalGap2.h,
                      ),
                      AuthField(
                        controller: password,
                        isItPassword: true,
                        textInputAction: TextInputAction.done,
                        prefixIcon: Icon(Icons.lock_rounded,
                            color: Theme.of(context).iconTheme.color),
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
                state.whenOrNull(
                  loginFailed: (message) {
                    showSnackBar(context, message: message);
                  },
                  loginSuccess: (user) async {
                    await inject<LocaleUserInfo>().setUsetData(user: user);
                    if (context.mounted) {
                      showSnackBar(context, message: 'auth.login_succ'.tr());
                      TasksBackgroundService.syncTasks(
                          ServicesBinding.rootIsolateToken);
                      NotificationBackgroundService().initializeService();
                      context.goNamed(Routes.profile.name);
                    }
                  },
                );
              },
              builder: (context, state) {
                return FilledButton.icon(
                  onPressed: () {
                    if (_globalFormKey.currentState!.validate()) {
                      AuthViewmodel.get(context)
                          .login(email: email.text, password: password.text);
                    }
                  },
                  label: Text(
                    'auth.login'.tr(),
                  ),
                  iconAlignment: IconAlignment.end,
                  icon: state.maybeWhen(
                    loginLoading: () => SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    ),
                    orElse: () => null,
                  ),
                );
              },
            ),
            SizedBox(
              height: AppMetrices.verticalGap2.h,
            ),

            // forgot password
            GestureDetector(
              onTap: () {
                context.goNamed(Routes.forgotPassword.name);
              },
              child: Text(
                'auth.forgot_pass'.tr(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.blue,
                    ),
              ),
            ),

            const SizedBox(
              height: AppMetrices.verticalGap2,
            ),
            const Divider(
              indent: 5,
              endIndent: 5,
            ),
            const SizedBox(
              height: AppMetrices.verticalGap3,
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
                    context.goNamed(Routes.signup.name);
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
