import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadingDataShimmer extends StatelessWidget {
  const LoadingDataShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[200]!,
      child: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                children: [
                  Container(
                    color: Colors.white,
                    width: 100.w,
                    height: 100.h,
                  ),
                  const SizedBox(),
                  Container(
                    color: Colors.white,
                    width: 20.w,
                    height: 20.h,
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                width: 20.w,
                height: 20.h,
              ),
              Container(
                color: Colors.white,
                width: 20.w,
                height: 20.h,
              ),
            ],
          );
        },
      ),
    );
  }
}
