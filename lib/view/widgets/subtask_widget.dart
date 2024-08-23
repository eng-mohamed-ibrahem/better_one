import 'package:better_one/core/constants/ui_dimentions.dart';
import 'package:better_one/view/widgets/input_field/task_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubtaskWidget extends StatelessWidget {
  const SubtaskWidget({
    super.key,
    this.onChange,
    required this.controller,
    required this.focusNode,
    this.onRemove,
    this.onCheck,
    required this.checkValue,
  });
  final dynamic Function(String)? onChange;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback? onRemove;
  final void Function(bool?)? onCheck;
  final bool checkValue;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: 5.w,
                  decoration: BoxDecoration(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
              SizedBox(height: AppMetrices.verticalGap.h),
              GestureDetector(
                onTap: onRemove,
                child: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.red[900],
                ),
              )
            ],
          ),
          Expanded(
            child: TaskField(
              controller: controller,
              focusNode: focusNode,
              style: checkValue
                  ? Theme.of(context).textTheme.titleMedium!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2,
                        decorationColor: Theme.of(context).secondaryHeaderColor,
                      )
                  : null,
              onChanged: onChange,
              hintText: 'task.description'.tr(),
              minLines: 1,
            ),
          ),
          Checkbox(
            value: checkValue,
            onChanged: onCheck,
          ),
        ],
      ),
    );
  }
}
