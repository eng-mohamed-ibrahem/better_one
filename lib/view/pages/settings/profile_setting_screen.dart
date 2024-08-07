import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
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
    return BlocConsumer<UserViewmodel, UserViewmodelState>(
      listener: (context, state) {
        if (state.isGetUserDetailsSuccess && state.user == null) {
          showSnackBar(context, message: 'core.ex_session'.tr());
          userLocaleDatabase.deleteUser();
          context.goNamed(Routes.login.name);
        }
        if (state.isLogoutLoading) {
          showLoadingDialog(context);
        }
        if (state.isLogoutSuccess) {
          context.pop();
          userLocaleDatabase.deleteUser();
          context.goNamed(Routes.login.name);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: (state.isGetUserDetailsSuccess && state.user != null)
              ? AppBar(
                  centerTitle: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  title: Text(
                    'setting.account.welcome'
                        .tr(namedArgs: {"name": state.user!.name}),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {
                        showLogoutDialog(context, onConfirm: () {
                          context.read<UserViewmodel>().logout();
                        });
                      },
                      icon: const Icon(Icons.logout_rounded),
                    ),
                  ],
                )
              : null,
          body: (state.isGetUserDetailsSuccess && state.user != null)
              ? SingleChildScrollView(
                  padding: const EdgeInsets.all(AppMetrices.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: AppMetrices.verticalGap),
                      AuthField(
                        controller: controller..text = state.user!.email,
                        readOnly: true,
                        prefixIcon: Icon(Icons.email_rounded,
                            color: Theme.of(context).iconTheme.color),
                        validator: Validators.validateEmail,
                      ),
                      const SizedBox(height: AppMetrices.verticalGap),
                    ],
                  ),
                )
              : (state.isGetUserDetailsFailed)
                  ? Center(
                      child: Failed(
                        failedAsset: LottieAssets.error,
                        retry: () {
                          context.read<UserViewmodel>().getUserDetails();
                        },
                        errorMessage: state.errorMessage,
                      ),
                    )
                  : const Center(
                      child: LottieIndicator(
                        statusAssets: LottieAssets.loadingFromToDatabase,
                      ),
                    ),
        );
      },
    );
  }
}
