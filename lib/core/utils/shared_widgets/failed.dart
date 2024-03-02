import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constants.dart';

class Failed extends StatelessWidget {
  const Failed({
    super.key,
    required this.failedAsset,
    required this.retry,
    this.errorMessage,
  });
  final VoidCallback retry;
  final String failedAsset;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          failedAsset,
          repeat: true,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: AppMetrices.heightSpace.h,
        ),
        Text(
          errorMessage ?? '',
          textAlign: TextAlign.center,
        ),
        IconButton(onPressed: retry, icon: const Icon(Icons.refresh)),
      ],
    );
  }
}
