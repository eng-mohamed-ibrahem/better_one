import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key, required this.title});
  final String title;

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  @override
  void initState() {
    context.read<UserViewmodel>().isActive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonl10n(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppMetrices.padding),
        child: BlocConsumer<UserViewmodel, UserViewmodelState>(
          listener: (context, state) {
            // todo check if user is active[has account]if yes, displayits data, else show auth page
            // todo show snackbar when signup or login successfully
          },
          builder: (context, state) {
            if (state.isUserActiveLoading) {
              return const Center(
                child: LottieIndicator(
                  statusAssets: LottieAssets.loadingFromToDatabase,
                ),
              );
            }
            if (state.isUserActiveFailed) {
              return Center(
                child: Failed(
                  failedAsset: LottieAssets.error,
                  retry: () {
                    context.read<UserViewmodel>().isActive();
                  },
                  errorMessage: state.errorMessage,
                ),
              );
            }
            if (state.isActive) {
              // todo display user data
            }
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .5,
                  child: SvgPicture.asset(
                    AppImages.splash,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GenerateRouter.signup);
                  },
                  child: Text(
                      "${'setting.account.cloud_upload'.tr()} ${'auth.signup'.tr()}"),
                ),
                const SizedBox(
                  height: AppMetrices.verticalGap,
                ),
                // RichText(
                //   text: TextSpan(
                //     text: 'setting.account.cloud_upload'.tr(),
                //     style: Theme.of(context).textTheme.bodySmall,
                //     recognizer: TapGestureRecognizer()
                //       ..onTap = () {
                //         Navigator.pushNamed(context, GenerateRouter.signup);
                //       },
                //     children: [
                //       TextSpan(
                //         text: ' ${'auth.signup'.tr()}',
                //         style: Theme.of(context).textTheme.bodySmall!.copyWith(
                //               color: Colors.blue,
                //             ),
                //       ),
                //     ],
                //   ),
                // ),
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
                  height: AppMetrices.verticalGap,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, GenerateRouter.login);
                  },
                  child: Text(
                      "${'setting.account.has_account'.tr()} ${'auth.login'.tr()}"),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
