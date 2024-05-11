import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/data_source/auth_data_source/supabase_auth_impl.dart';
import 'package:better_one/repositories/auth_repo/auth_repo_impl.dart';
import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettingScreen extends StatelessWidget {
  const AccountSettingScreen({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    // your data are backed up at [e-mail]
    userLocaleDatabase.getUserDataFromLocale();
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonLl10n(),
        ),
      ),
      body: BlocProvider(
        create: (context) => AuthViewmodel(
          authRepo: AuthRepoImpl(
            authSource: SupabaseAuthImpl(),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppMetrices.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: AppMetrices.heightSpace3,
              ),
              SvgPicture.asset(
                AppImages.splash,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, GenerateRouter.signup);
                },
                child: Text(
                    "${'setting.account.cloud_upload'.tr()} ${'auth.signup'.tr()}"),
              ),
              const SizedBox(
                height: AppMetrices.heightSpace,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, GenerateRouter.login);
                },
                child: Text(
                    "${'setting.account.has_account'.tr()} ${'auth.login'.tr()}"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
