import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/utils/bloc_observer/cubit_observer.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/firebase_options.dart';
import 'package:better_one/root_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initDependency();

  Bloc.observer = CubitObserver();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: AppColors.secondColor,
    ),
  );
  settingRepo.getLanguage().then(
    (value) {
      value.when(
        success: (language) {
          initializeDateFormatting(
            language.languageCode,
          );
        },
        failure: (error) {
          initializeDateFormatting('en');
        },
      );
    },
  );
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://fc3b9144ea20727176bf1c73bce9d6a4@o4508256906379264.ingest.de.sentry.io/4508256973619280';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 0.1;
      },
      appRunner: () => runApp(
        EasyLocalization(
          path: 'lib/config/l10n/translation',
          supportedLocales: const [
            Locale('en'),
            Locale('ar'),
          ],
          fallbackLocale: const Locale('en'),
          saveLocale: true,
          child: const RootApp(),
        ),
      ),
    );
  } else {
    runApp(
      EasyLocalization(
        path: 'lib/config/l10n/translation',
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
        ],
        fallbackLocale: const Locale('en'),
        saveLocale: true,
        child: const RootApp(),
      ),
    );
  }
}
