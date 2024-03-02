import 'package:better_one/app.dart';
import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/utils/bloc_observer/cubit_observer.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependency();
  await EasyLocalization.ensureInitialized();

  Bloc.observer = CubitObserver();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.secondColor,
    ),
  );
  initializeDateFormatting(
    'en',
  );
  runApp(const RootApp());
}
