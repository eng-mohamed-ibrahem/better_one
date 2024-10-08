import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/utils/methods/methods.dart';
import 'package:better_one/model/task_model/task_model.dart';
import 'package:better_one/view/widgets/task/task_card.dart';
import 'package:better_one/view_models/task_viewmodel/task_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModifiyCardTask extends StatefulWidget {
  const ModifiyCardTask({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  State<ModifiyCardTask> createState() => _ModifiyCardTaskState();
}

class _ModifiyCardTaskState extends State<ModifiyCardTask>
    with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 400),
      reverseDuration: const Duration(milliseconds: 400),
    );

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _animationController.drive(Tween(begin: 1.0, end: 0.0)),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 25,
                  onPressed: () {
                    showDeleteTaskDialog(
                      context,
                      message: widget.task.title,
                      onConfirm: () {
                        _animationController.forward();
                        _animationController.addListener(() {
                          if (_animationController.isCompleted) {
                            context
                                .read<TaskViewmodel>()
                                .deleteTask(widget.task);
                            showSnackBar(
                              context,
                              message: 'task.remove'.tr(),
                            );
                            _animationController.stop();
                          }
                        });
                      },
                    );
                  },
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  icon: const Icon(
                    Icons.delete_forever,
                    color: AppColors.hightlightColor,
                  ),
                ),
                IconButton(
                  iconSize: 25,
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit_note_rounded,
                  ),
                ),
              ],
            ),
          ),
          CardTask(task: widget.task),
        ],
      ),
    );
  }
}
