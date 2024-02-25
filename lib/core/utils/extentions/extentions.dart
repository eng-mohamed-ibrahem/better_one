import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension ResponsiveScreen on int {
  double get rsh {
    return (this / MediaQuery.sizeOf(GetIt.I.get<BuildContext>()).height) * 100;
  }

  double get rsw {
    return (this / MediaQuery.sizeOf(GetIt.I.get<BuildContext>()).width) * 100;
  }
}
