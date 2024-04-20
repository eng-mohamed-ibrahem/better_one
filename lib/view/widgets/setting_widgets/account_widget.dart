import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/app_metrices.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // your data are backed up at [e-mail]
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
    );
  }
}
