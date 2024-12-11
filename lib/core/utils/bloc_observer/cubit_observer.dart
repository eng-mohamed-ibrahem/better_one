import 'dart:developer';

import 'package:better_one/view_models/auth_viewmodel/auth_viewmodel.dart';
import 'package:better_one/view_models/comment_viewmodel/comment_viewmodel.dart';
import 'package:better_one/view_models/notification_viewmodel/notification_viewmodel.dart';
import 'package:better_one/view_models/setting_viewmodel/setting_viewmode.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:better_one/view_models/user_viewmodel/user_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // Get stack trace and location
    final location = _extractLocation(StackTrace.current);
    log("\n${bloc.runtimeType}: Triggered by $location\n ${change.currentState} \n>> ${change.nextState}");
    super.onChange(bloc, change);
  }

  String _extractLocation(StackTrace stackTrace) {
    final stackLines = stackTrace.toString().trim().split('\n');
    stackLines.retainWhere(
      (element) {
        // to filter the Stacktrace lines to be triggered by Your code
        return element.contains('package:better_one');
      },
    );
    log(stackLines.join('\n'));
    if (stackLines.length > 1) {
      return stackLines.last.trim();
    }
    return 'Unknown Location';
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
    if (bloc is UserViewmodel) {
      GetIt.I.unregister<UserViewmodel>();
    }
    if (bloc is NotificationViewmodel) {
      GetIt.I.unregister<NotificationViewmodel>();
    }
    if (bloc is CommentViewModel) {
      GetIt.I.unregister<CommentViewModel>();
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
    if (bloc is NotificationViewmodel) {
      GetIt.I.registerSingleton<NotificationViewmodel>(bloc);
    }
    if (bloc is CommentViewModel) {
      GetIt.I.registerSingleton<CommentViewModel>(bloc);
    }
    super.onCreate(bloc);
  }
}
