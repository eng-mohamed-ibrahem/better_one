import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
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
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  void initState() {
    context.read<UserViewmodel>().getUserDetails();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserViewmodel, UserViewmodelState>(
        listener: (context, state) {
          state.whenOrNull(
            getUserDetailsSuccess: (user) {
              emailController.text = user.email;
              nameController.text = user.name;
            },
            noUserFound: (message) {
              showSnackBar(context, message: message);
              userLocaleDatabase.deleteUser();
              context.goNamed(Routes.login.name);
            },
            logoutLoading: () {
              showLoadingDialog(context);
            },
            logoutFailed: (message, failure) {
              showSnackBar(context, message: message);
              context.pop();
            },
            logoutSuccess: () {
              userLocaleDatabase.deleteUser();
              context.goNamed(Routes.login.name);
            },
          );
        },
        builder: (context, state) {
          return state.maybeWhen(
            getUserDetailsFailed: (message, failure) {
              return Center(
                child: Failed(
                  failedAsset: failure is NoInternetFailure
                      ? LottieAssets.noInternet
                      : LottieAssets.error,
                  retry: () {
                    context.read<UserViewmodel>().getUserDetails();
                  },
                  errorMessage: message,
                ),
              );
            },
            getUserDetailsLoading: () {
              return const Center(
                child: LottieIndicator(
                  statusAssets: LottieAssets.loadingFromToDatabase,
                ),
              );
            },
            noUserFound: (message) {
              return const SizedBox.shrink();
            },
            orElse: () {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      child: Stack(
                        children: [
                          CustomPaint(
                            size: Size(
                              MediaQuery.sizeOf(context).width,
                              MediaQuery.sizeOf(context).height * 0.15,
                            ),
                            painter: ProfileBackgroundPaint(
                              fillColor: Theme.of(context).secondaryHeaderColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: MediaQuery.paddingOf(context).top),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: BackButtonl10n(),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        showLogoutDialog(
                                          context,
                                          onConfirm: () {
                                            context
                                                .read<UserViewmodel>()
                                                .logout();
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.logout_rounded),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                    height: AppMetrices.verticalGap2),
                                Text(
                                  context
                                      .read<UserViewmodel>()
                                      .currentUser
                                      .name,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  context
                                      .read<UserViewmodel>()
                                      .currentUser
                                      .email,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: AppMetrices.verticalGap),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.cloud_sync_outlined),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      'core.sync'.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    /// change name
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppMetrices.horizontalGap),
                      child: Column(
                        children: [
                          SizedBox(height: AppMetrices.verticalGap3.h),
                          Row(
                            children: [
                              Expanded(
                                child: AuthField(
                                  readOnly: true,
                                  controller: nameController,
                                  labelText: 'auth.u_name'.tr(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  context.goNamed(Routes.changeName.name);
                                },
                                child: const Icon(Icons.edit_rounded),
                              ),
                            ],
                          ),

                          /// change email
                          SizedBox(height: AppMetrices.verticalGap3.h),
                          Row(
                            children: [
                              Expanded(
                                child: AuthField(
                                  readOnly: true,
                                  controller: emailController,
                                  labelText: 'auth.u_email'.tr(),
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  context.goNamed(Routes.changeEmail.name);
                                },
                                child: const Icon(Icons.edit_rounded),
                              ),
                            ],
                          ),

                          /// change password
                          SizedBox(height: AppMetrices.verticalGap3.h),
                          Row(
                            children: [
                              Expanded(
                                child: AbsorbPointer(
                                  child: AuthField(
                                    readOnly: true,
                                    isItPassword: true,
                                    controller: passwordController
                                      ..text = "********",
                                    labelText: 'auth.u_pass'.tr(),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  context.goNamed(Routes.changePassword.name);
                                },
                                child: const Icon(Icons.edit_rounded),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        heroTag: 'feedback',
        onPressed: () {
          context.goNamed(Routes.feedback.name);
        },
        child: const Icon(Icons.feedback),
      ),
    );
  }
}

class ProfileBackgroundPaint extends CustomPainter {
  ProfileBackgroundPaint({required this.fillColor});
  final Color fillColor;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 2);
    path.arcToPoint(Offset(0, size.height / 2),
        radius: const Radius.circular(10), largeArc: true);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}