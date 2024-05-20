import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountSettingScreen extends StatefulWidget {
  const AccountSettingScreen({super.key, required this.title});
  final String title;

  @override
  State<AccountSettingScreen> createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    context.read<UserViewmodel>().getUserDetails();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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
      body: BlocConsumer<UserViewmodel, UserViewmodelState>(
        listener: (context, state) {
          if (state.isGetUserDetailsSuccess && state.user == null) {
            showSnackBar(context, message: 'core.ex_session'.tr());
            userLocaleDatabase.deleteUser();
            Navigator.pushReplacementNamed(context, GenerateRouter.login);
          }
        },
        builder: (context, state) {
          if (state.isGetUserDetailsSuccess && state.user != null) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppMetrices.padding),
              child: Column(
                children: [
                  const SizedBox(height: AppMetrices.verticalGap2),
                  Text(
                    'setting.account.email_backup'.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: AppMetrices.verticalGap),
                  AuthField(
                    controller: controller..text = state.user!.email,
                    prefixIcon: const Icon(Icons.email_rounded),
                  ),
                  const SizedBox(height: AppMetrices.verticalGap),
                ],
              ),
            );
          }
          if (state.isGetUserDetailsFailed) {
            return Center(
              child: Failed(
                failedAsset: LottieAssets.error,
                retry: () {
                  context.read<UserViewmodel>().getUserDetails();
                },
                errorMessage: state.errorMessage,
              ),
            );
          }
          return const Center(
            child: LottieIndicator(
              statusAssets: LottieAssets.loadingFromToDatabase,
            ),
          );
        },
      ),
    );
  }
}
