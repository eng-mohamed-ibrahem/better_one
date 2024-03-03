import 'package:better_one/config/generate_router.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewmodel.get(context).getTasks();
    HomeViewmodel.get(context).getTotalEstimatedTime();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(GenerateRouter.home, (route) => false);
    });
    return const Placeholder();
  }
}
