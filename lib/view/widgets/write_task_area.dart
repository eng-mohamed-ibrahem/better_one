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
    required this.descriptionController,
    required this.subTasks,
    this.onChanged,
  });

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final dynamic Function(String)? onChanged;
  final List<SubTask> subTasks;

  @override
  State<WriteTaskArea> createState() => _WriteTaskAreaState();
}

class _WriteTaskAreaState extends State<WriteTaskArea> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late int formCount;
  @override
  void initState() {
    widget.subTasks.isEmpty
        ? formCount = 1
        : formCount = widget.subTasks.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppMetrices.verticalGap.h,
            horizontal: AppMetrices.horizontalGap2.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TaskField(
                controller: widget.titleController,
                onChanged: widget.onChanged,
                labelText: 'task.title'.tr(),
                textFieldHeight: 1.3,
                maxLines: 3,
                minLines: 1,
                prefixIcon: const Icon(Icons.task),
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
                    height: 5.h,
                    color: Theme.of(context).secondaryHeaderColor,
                    indent: AppMetrices.horizontalGap2.w,
                    endIndent: AppMetrices.horizontalGap2.w,
                  );
                },
                itemBuilder: (context, index) {
                  SubTask? subTask = widget.subTasks.elementAtOrNull(index);
                  return CheckboxListTile(
                    value: subTask?.completed,
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    tristate: true,
                    onChanged: (isComeleted) {
                      setState(() {
                        subTask != null
                            ? widget.subTasks[index] = subTask.copyWith(
                                completed: isComeleted ?? false)
                            : null;
                      });
                    },
                    title: TaskField(
                      initialValue: subTask?.title,
                      onChanged: (text) {
                        widget.onChanged?.call(text);
                        widget.subTasks.elementAtOrNull(index) == null
                            ? widget.subTasks.add(
                                SubTask(title: text),
                              )
                            : widget.subTasks[index] =
                                widget.subTasks[index].copyWith(title: text);
                      },
                      hintText: 'task.description'.tr(),
                      minLines: 1,
                    ),
                  );
                },
              ),
              SizedBox(height: AppMetrices.verticalGap.h),
              FilledButton.icon(
                onPressed: () {
                  widget.subTasks.length == formCount
                      ? setState(() {
                          formCount++;
                        })
                      : null;
                },
                icon: const Icon(Icons.my_library_add_outlined),
                label: Text('task.add_sub_task'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
