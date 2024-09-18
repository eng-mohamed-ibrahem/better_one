import 'dart:developer';

import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("${bloc.runtimeType}:\n ${change.currentState} \n=> ${change.nextState}");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    log("${bloc.runtimeType} closed");
    if (bloc is TaskViewmodel) {
      GetIt.I.unregister<TaskViewmodel>();
    }
    if (bloc is SettingViewmodel) {
      GetIt.I.unregister<SettingViewmodel>();
    }
    if (bloc is AuthViewmodel) {
      GetIt.I.unregister<AuthViewmodel>();
    }

    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("${bloc.runtimeType} created");

    if (bloc is TaskViewmodel) {
      GetIt.I.registerSingleton<TaskViewmodel>(bloc);
    }
    if (bloc is SettingViewmodel) {
      GetIt.I.registerSingleton<SettingViewmodel>(bloc);
    }
    if (bloc is AuthViewmodel) {
      GetIt.I.registerSingleton<AuthViewmodel>(bloc);
    }
    if (bloc is UserViewmodel) {
      GetIt.I.registerSingleton<UserViewmodel>(bloc);
    }
    super.onCreate(bloc);
  }
}
