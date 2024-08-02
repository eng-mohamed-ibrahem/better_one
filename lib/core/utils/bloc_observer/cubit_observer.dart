import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log("${bloc.runtimeType}:\n ${change.currentState} \n=> ${change.nextState}");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    log("${bloc.runtimeType} closed");
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log("${bloc.runtimeType} created");

    /// could be used register here if needed
    /// but take care for lazy attribute in cubit becuase it created if called first time
    // if (bloc.runtimeType == TaskViewmodel) {
    //   GetIt.I.registerSingleton<TaskViewmodel>(bloc as TaskViewmodel);
    // }
    // if (bloc.runtimeType == SettingViewModel) {
    //   GetIt.I.registerSingleton<SettingViewModel>(bloc as SettingViewModel);
    // }
    super.onCreate(bloc);
  }
}
