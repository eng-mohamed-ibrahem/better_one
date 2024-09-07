import 'package:better_one/core/constants/ui_dimentions.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/view/widgets/input_field/auth_field.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ChangeNameScreen extends StatefulWidget {
  const ChangeNameScreen({super.key});

  @override
  State<ChangeNameScreen> createState() => _ChangeNameScreenState();
}

class _ChangeNameScreenState extends State<ChangeNameScreen> {
  final TextEditingController oldNameController = TextEditingController();
  final TextEditingController newNameController = TextEditingController();

  @override
  void initState() {
    oldNameController.text = context.read<UserViewmodel>().currentUser.name;
    super.initState();
  }

  @override
  void dispose() {
    oldNameController.dispose();
    newNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FittedBox(
          child: BackButtonl10n(),
        ),
        title: Text(
          "profile.change_name.title".tr(),
        ),
        // leading: ,
      ),
      body: BlocConsumer<UserViewmodel, UserViewmodelState>(
        listener: (context, state) {
          state.whenOrNull(
            changeNameSuccess: (user) {
              showSnackBar(context,
                  message: "profile.change_name.success".tr());
              context.read<UserViewmodel>().getUserDetails();
              // return to profile screen
              context.pop();
            },
            changeNameFailed: (message) {
              // pop the loading dialog
              context.pop();
              showSnackBar(context, message: message);
            },
            changeNameLoading: () {
              showLoadingDialog(context);
            },
          );
        },
        builder: (context, state) {
          return Center(
            child: Card(
              shadowColor: Theme.of(context).shadowColor,
              margin: EdgeInsets.symmetric(
                horizontal: AppMetrices.horizontalGap.w,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "profile.change_name.old_name".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  AuthField(
                    readOnly: true,
                    controller: oldNameController,
                  ),
                  SizedBox(
                    height: AppMetrices.verticalGap2.h,
                  ),
                  Text(
                    "profile.change_name.new_name".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  AuthField(
                    controller: newNameController,
                  ),
                  SizedBox(
                    height: AppMetrices.verticalGap3.h,
                  ),
                  TextButton(
                    onPressed: () {
                      context
                          .read<UserViewmodel>()
                          .changeName(newNameController.text.trim());
                    },
                    child:
                        const Text("profile.change_name.confirm_new_name").tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
