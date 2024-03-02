import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/constants/app_metrices.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/view/widgets/card_note.dart';
import 'package:flutter/material.dart';

class ModifiyCardNote extends StatefulWidget {
  const ModifiyCardNote({
    super.key,
    required this.note,
    required this.onRemove,
  });
  final NoteModel note;
  final VoidCallback onRemove;

  @override
  State<ModifiyCardNote> createState() => _ModifiyCardNoteState();
}

class _ModifiyCardNoteState extends State<ModifiyCardNote>
    with TickerProviderStateMixin {
  bool isOpened = false;
  late final AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      value: 0,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 200),
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
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpened = !isOpened;
          isOpened
              ? _animationController.forward()
              : _animationController.reverse();
        });
      },
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SlideTransition(
              position: _animationController.drive(
                Tween<Offset>(
                  begin: const Offset(1.0, 0),
                  end: const Offset(-0.1, 0),
                ),
              ),
              child: Container(
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.only(
                    top: MediaQuery.sizeOf(context).height * .015),
                height: MediaQuery.sizeOf(context).height * .04,
                // width: MediaQuery.sizeOf(context).width * .35,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.sizeOf(context).width * .25,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(AppMetrices.borderRadius1),
                    topLeft: Radius.circular(AppMetrices.borderRadius1),
                    bottomRight: Radius.circular(AppMetrices.borderRadius1),
                  ),
                  color: AppColors.secondColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 25,
                      onPressed: widget.onRemove,
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
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          GenerateRouter.noteScreen,
                          arguments: widget.note.id,
                        );
                      },
                      icon: const Icon(
                        Icons.edit_note_rounded,
                      ),
                    ),

                    // widget.note.status == NoteStatus.none ||
                    //         widget.note.status == NoteStatus.paused
                    //     ? IconButton(
                    //         iconSize: 25,
                    //         style: IconButton.styleFrom(
                    //           padding: EdgeInsets.zero,
                    //         ),
                    //         onPressed: () {
                    //           // start stopwatch
                    //           // 1: update note with note status progrss
                    //           // 1: update note with note status progrss
                    //           HomeViewmodel.get(context).controlStopwatchOfNote(
                    //               widget.note, NoteStatus.inprogress);

                    //           // 2: start stopwatch
                    //           HomeViewmodel.get(context)
                    //               .state
                    //               .stopwatch!
                    //               .start();
                    //         },
                    //         icon: const Icon(
                    //           Icons.play_circle_outlined,
                    //         ),
                    //       )
                    //     : IconButton(
                    //         iconSize: 25,
                    //         style: IconButton.styleFrom(
                    //           padding: EdgeInsets.zero,
                    //         ),
                    //         onPressed: () {
                    //           // 1: update note with note status progrss
                    //           HomeViewmodel.get(context).controlStopwatchOfNote(
                    //               widget.note, NoteStatus.paused);
                    //           HomeViewmodel.get(context)
                    //               .state
                    //               .stopwatch!
                    //               .stop();
                    //         },
                    //         icon: const Icon(
                    //           Icons.pause_circle_outline,
                    //         ),
                    //       ),
                  ],
                ),
              ),
            ),
          ),
          CardNote(note: widget.note),
        ],
      ),
    );
  }
}
