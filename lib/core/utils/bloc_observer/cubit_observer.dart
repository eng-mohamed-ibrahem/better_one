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
    log(bloc.toString());
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    log(bloc.toString());
    super.onCreate(bloc);
  }
}
