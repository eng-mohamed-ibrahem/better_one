import 'package:better_one/core/constants/constants.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/input_field/task_input_field.dart';
import 'package:better_one/view/widgets/subtask_widget.dart';
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

class _WriteTaskAreaState extends State<WriteTaskArea>
    with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late final List<SubTaskConfig> subTaskConfig;
  @override
  void initState() {
    subTaskConfig = List.generate(
      widget.subTasks.isEmpty ? 1 : widget.subTasks.length,
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
              TaskInputField(
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
              AnimatedList.separated(
                shrinkWrap: true,
                key: _listKey,
                physics: const NeverScrollableScrollPhysics(),
                initialItemCount: subTaskConfig.length,
                separatorBuilder: (context, index, animation) {
                  return Divider(
                    height: 20.h,
                    color: Theme.of(context).secondaryHeaderColor,
                    indent: AppMetrices.horizontalGap2.w,
                    endIndent: AppMetrices.horizontalGap2.w,
                  );
                },
                removedSeparatorBuilder: (context, index, animation) {
                  return Divider(
                    height: 20.h,
                    color: Theme.of(context).secondaryHeaderColor,
                    indent: AppMetrices.horizontalGap2.w,
                    endIndent: AppMetrices.horizontalGap2.w,
                  );
                },
                itemBuilder: (context, index, animation) {
                  SubTask? subTask = widget.subTasks.elementAtOrNull(index);
                  return ScaleTransition(
                    scale: animation,
                    child: SubtaskWidget(
                      controller: subTaskConfig[index].controller,
                      focusNode: subTaskConfig[index].focusNode,
                      checkValue: subTask?.completed ?? false,
                      onChange: (text) {
                        widget.onChanged?.call(text);
                        widget.subTasks.elementAtOrNull(index) == null
                            ? widget.subTasks.add(
                                SubTask(title: text),
                              )
                            : widget.subTasks[index] =
                                widget.subTasks[index].copyWith(title: text);
                      },
                      onRemove: () {
                        /// remove sub task
                        index <= widget.subTasks.length - 1
                            ? () {
                                var removedSubtask =
                                    widget.subTasks.removeAt(index);
                                _listKey.currentState!.removeItem(
                                  index,
                                  (context, animation) {
                                    return SizeTransition(
                                      sizeFactor: animation,
                                      child: SubtaskWidget(
                                        controller:
                                            subTaskConfig[index].controller,
                                        focusNode:
                                            subTaskConfig[index].focusNode,
                                        checkValue: removedSubtask.completed,
                                      ),
                                    );
                                  },
                                );
                                Future.delayed(
                                    const Duration(
                                      milliseconds: 300,
                                    ),
                                    () => subTaskConfig
                                        .removeItemAndConfigAt(index));
                              }()
                            : null;
                      },
                      onCheck: (isComeleted) {
                        setState(() {
                          subTask != null
                              ? widget.subTasks[index] = subTask.copyWith(
                                  completed: isComeleted ?? false)
                              : null;
                        });
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: AppMetrices.verticalGap2.h),
              IconButton(
                onPressed: () {
                  widget.subTasks.length == subTaskConfig.length
                      ? () {
                          _listKey.currentState!
                              .insertItem(subTaskConfig.length);
                          subTaskConfig.add(
                            SubTaskConfig(
                              controller: TextEditingController(),
                              focusNode: FocusNode()..requestFocus(),
                            ),
                          );
                        }()
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
