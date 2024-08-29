import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieIndicator extends StatelessWidget {
  const LottieIndicator({super.key, required this.statusAssets, this.fit});
  final String statusAssets;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      statusAssets,
      repeat: true,
      fit: fit ?? BoxFit.fill,
    );
  }
}
