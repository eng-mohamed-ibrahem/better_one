import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("${bloc.runtimeType}: ${change.toString()}");
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint(bloc.toString());
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint(bloc.toString());
    super.onCreate(bloc);
  }
}
