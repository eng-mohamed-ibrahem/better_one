import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

extension ResponsiveScreen on num {
  double get rsh {
    return (this / MediaQuery.sizeOf(GetIt.I.get<BuildContext>()).height) * 100;
  }

  double get rsw {
    return (this / MediaQuery.sizeOf(GetIt.I.get<BuildContext>()).width) * 100;
  }
}

extension Sizes on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get widgth => MediaQuery.sizeOf(this).width;
}

