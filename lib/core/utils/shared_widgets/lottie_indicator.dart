import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieIndicator extends StatelessWidget {
  const LottieIndicator({super.key, required this.statusAssets});
  final String statusAssets;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      statusAssets,
      repeat: true,
      fit: BoxFit.fill,
    );
  }
}
