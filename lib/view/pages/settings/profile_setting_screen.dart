import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/core/errors/failure.dart';
import 'package:better_one/core/utils/background_service/tasks_background_service.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
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
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var broadcastStream =
          TasksBackgroundService.downloadReceiverPort.asBroadcastStream();
      GetIt.I.isRegistered<bool>()
          ? null
          : () {
              broadcastStream.listen(
                (message) {
                  message is bool && message
                      ? () {
                          if (mounted) {
                            setState(() {
                              showSnackBar(context,
                                  message: "Tasks Downloaded Successfully");
                              context.read<TaskViewmodel>().getTasks();
                            });
                          }
                        }()
                      : null;
                },
              );
              GetIt.I.registerSingleton<bool>(true);
            }();
    });
    super.didChangeDependencies();
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
        state.whenOrNull(
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
            return Material(
              child: Center(
                child: Failed(
                  failedAsset: failure is NoInternetFailure
                      ? LottieAssets.noInternet
                      : LottieAssets.error,
                  retry: () {
                    context.read<UserViewmodel>().getUserDetails();
                  },
                  errorMessage: message,
                ),
              ),
            );
          },
          getUserDetailsLoading: () {
            return const Material(
              child: Center(
                child: LottieIndicator(
                  statusAssets: LottieAssets.loadingFromToDatabase,
                ),
              ),
            );
          },
          noUserFound: (message) {
            return const Material(
              child: SizedBox.shrink(),
            );
          },
          orElse: () {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width,
                      child: CustomPaint(
                        painter: ProfileBackgroundPaint(
                          fillColor: Theme.of(context).secondaryHeaderColor,
                        ),
                        child: Padding(
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
                              const SizedBox(height: AppMetrices.verticalGap2),
                              Text(
                                context.read<UserViewmodel>().currentUser.name,
                                style: Theme.of(context).textTheme.titleLarge,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                context.read<UserViewmodel>().currentUser.email,
                                style: Theme.of(context).textTheme.titleMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: AppMetrices.verticalGap),
                              () {
                                if (userLocaleDatabase.isDownloadedTasks() !=
                                    null) {
                                  return userLocaleDatabase.isDownloadedTasks()!
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Icon(Icons.sync),
                                            SizedBox(
                                              width: 5.w,
                                            ),
                                            const Icon(Icons.check),
                                          ],
                                        )
                                      : IconButton(
                                          onPressed: () {
                                            TasksBackgroundService
                                                .downloadTasks(ServicesBinding
                                                    .rootIsolateToken);
                                          },
                                          icon: const Icon(
                                              Icons.sync_problem_rounded),
                                        );
                                } else {
                                  return SizedBox(
                                    width: 30.w,
                                    height: 30.h,
                                    child: const LottieIndicator(
                                      statusAssets: LottieAssets.cloudSync,
                                    ),
                                  );
                                  // return const Icon(Icons.cloud_sync_outlined);
                                }
                              }(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
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
