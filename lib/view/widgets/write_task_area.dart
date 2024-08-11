import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/input_field/task_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WriteTaskArea extends StatefulWidget {
  const WriteTaskArea({
    super.key,
    required this.titleController,
    required this.subTasks,
    this.onChanged,
  });

  final TextEditingController titleController;
  final dynamic Function(String)? onChanged;
  final List<SubTask> subTasks;

  @override
  State<WriteTaskArea> createState() => _WriteTaskAreaState();
}

class _WriteTaskAreaState extends State<WriteTaskArea> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int formCount;
  late final List<SubTaskConfig> subTaskConfig;
  @override
  void initState() {
    widget.subTasks.isEmpty
        ? formCount = 1
        : formCount = widget.subTasks.length;
    subTaskConfig = List.generate(
      formCount,
      (index) => SubTaskConfig(
        controller: TextEditingController(
          text: widget.subTasks.elementAtOrNull(index)?.title,
        ),
        focusNode: FocusNode(),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    for (var element in subTaskConfig) {
      element.controller.dispose();
      element.focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: 0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppMetrices.verticalGap.h,
            horizontal: AppMetrices.horizontalGap2.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskField(
                controller: widget.titleController,
                onChanged: widget.onChanged,
                labelText: 'task.title'.tr(),
                textFieldHeight: 1.3,
                maxLines: 3,
                minLines: 1,
                textAlign: TextAlign.center,
              ),
              Divider(
                indent: AppMetrices.horizontalGap2.w,
                endIndent: AppMetrices.horizontalGap2.w,
              ),
              SizedBox(height: AppMetrices.verticalGap.h),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: formCount,
                separatorBuilder: (context, index) {
                  return Divider(
                    height: 20.h,
                    color: Theme.of(context).secondaryHeaderColor,
                    indent: AppMetrices.horizontalGap2.w,
                    endIndent: AppMetrices.horizontalGap2.w,
                  );
                },
                itemBuilder: (context, index) {
                  SubTask? subTask = widget.subTasks.elementAtOrNull(index);
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
                              onTap: () {
                                /// remove sub task
                                index <= widget.subTasks.length - 1
                                    ? setState(
                                        () {
                                          widget.subTasks.removeAt(index);
                                          formCount--;
                                          subTaskConfig
                                              .removeItemAndConfigAt(index);
                                        },
                                      )
                                    : null;
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.red[900],
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: TaskField(
                            controller: subTaskConfig[index].controller,
                            focusNode: subTaskConfig[index].focusNode,
                            style: subTask?.completed ?? false
                                ? Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      decorationThickness: 2,
                                      decorationColor: Theme.of(context)
                                          .secondaryHeaderColor,
                                    )
                                : null,
                            onChanged: (text) {
                              widget.onChanged?.call(text);
                              widget.subTasks.elementAtOrNull(index) == null
                                  ? widget.subTasks.add(
                                      SubTask(title: text),
                                    )
                                  : widget.subTasks[index] = widget
                                      .subTasks[index]
                                      .copyWith(title: text);
                            },
                            hintText: 'task.description'.tr(),
                            minLines: 1,
                          ),
                        ),
                        Checkbox(
                          value: subTask?.completed ?? false,
                          onChanged: (isComeleted) {
                            setState(() {
                              subTask != null
                                  ? widget.subTasks[index] = subTask.copyWith(
                                      completed: isComeleted ?? false)
                                  : null;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: AppMetrices.verticalGap2.h),
              IconButton(
                onPressed: () {
                  widget.subTasks.length == formCount
                      ? setState(() {
                          formCount++;
                          subTaskConfig.add(
                            SubTaskConfig(
                              controller: TextEditingController(),
                              focusNode: FocusNode()..requestFocus(),
                            ),
                          );
                        })
                      : null;
                },
                icon: const Icon(Icons.my_library_add_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubTaskConfig {
  final TextEditingController controller;
  final FocusNode focusNode;

  SubTaskConfig({
    required this.controller,
    required this.focusNode,
  });
}

extension on List<SubTaskConfig> {
  SubTaskConfig removeItemAndConfigAt(int index) {
    this[index].controller.dispose();
    this[index].focusNode.dispose();
    return removeAt(index);
  }
}
