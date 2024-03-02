import 'dart:async';

import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/enum/note_status.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/core/utils/shared_widgets/note_field.dart';
import 'package:better_one/core/utils/snack_bar/snack_bar.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/view/widgets/duration_widget.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/constants.dart';

///* Note Screen
///
/// This screen is used to write note and edit note
/// display estimate time for note
/// display quote
/// control note status and save note
/// update estimated time of note and add this time to total time
///*
class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> with RouteAware {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  NoteModel? note;
  String? noteId;
  bool isNoteModified = false;
  Duration runningTime = Duration.zero;
  Timer? timer;

  @override
  void didPopNext() {
    GenerateRouter.activeRoute = GenerateRouter.noteScreen;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    noteId = ModalRoute.of(context)!.settings.arguments as String?;
    if (noteId != null) {
      HomeViewmodel.get(context).getNoteById(noteId!);
    }
    QuoteViewmode.get(context).getRandomQuote();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    timer?.cancel();
    super.dispose();
  }

  /// save the estimated time on navigate back
  /// if navigate back while the note is inprogress then pause the note
  @override
  void deactivate() {
    note != null
        ? HomeViewmodel.get(context).updateNoteAndTotalEstimatedTime(
            note!,
            note!.status == NoteStatus.inprogress
                ? NoteStatus.paused
                : note!.status,
            runningTime,
          )
        : null;
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: true,
        left: false,
        right: false,
        child: BlocConsumer<HomeViewmodel, HomeViewmodelState>(
          listener: (context, state) {
            if (state.isGetNoteByIdCompleted) {
              note = state.noteById;
              titleController.text = note!.title;
              descriptionController.text = note!.body;
            }

            if (state.isNoteUpdateCompleted) {
              note = state.updatedNote;
              if (isNoteModified) {
                showSnackBar(
                  context,
                  message: 'note_updated'.tr(),
                );
              }
            }
            if (state.isNoteAddCompleted) {
              note = state.addedNote;
              localNotification.display(
                notification: NotificationModel(
                  id: DateTime.now().microsecond,
                  title: 'note_motive'.tr(),
                  body: titleController.text,
                  payload: note!.id,
                ),
              );
            }
            timer?.cancel();
            timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              // 1: update the running time
              note!.status == NoteStatus.inprogress
                  ? setState(
                      () {
                        runningTime = Duration(seconds: timer.tick);
                      },
                    )
                  : timer.cancel();
            });
          },
          builder: (context, state) {
            if (state.isGetNoteByIdLoading) {
              return const Center(
                child: LottieIndicator(
                  statusAssets: LottieAssets.searchForNote,
                ),
              );
            }
            if (state.isGetNoteByIdFailed) {
              return Center(
                child: Failed(
                  failedAsset: LottieAssets.searchForNoteFailed,
                  errorMessage: state.errorMessage,
                  retry: () {
                    HomeViewmodel.get(context).getNoteById(noteId!);
                  },
                ),
              );
            }
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                SizedBox(height: AppMetrices.heightSpace.h),
                SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(height: AppMetrices.heightSpace3.h),
                        BlocBuilder<QuoteViewmode, QuoteViewmodelState>(
                          builder: (context, state) {
                            if (state.quote == null) {
                              return const SizedBox();
                            }
                            return AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                color: AppColors.secondColor,
                                padding: EdgeInsets.all(10.w),
                                width: double.infinity,
                                child: Text(
                                  state.quote!.content!,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FontStyle.italic,
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: AppMetrices.heightSpace2.h),
                        NoteField(
                          controller: titleController,
                          onChanged: (p0) => isNoteModified = true,
                          labelText: 'note_title'.tr(),
                          textFieldHeight: 1,
                          maxLines: null,
                          minLines: 1,
                          prefixIcon: const Icon(Icons.task),
                        ),
                        SizedBox(height: AppMetrices.heightSpace.h),
                        Divider(
                          color: AppColors.white,
                          thickness: 1,
                          height: 10,
                          indent: AppMetrices.widthSpace2.w,
                          endIndent: AppMetrices.widthSpace2.w,
                        ),
                        SizedBox(height: AppMetrices.heightSpace.h),
                        NoteField(
                          controller: descriptionController,
                          onChanged: (p0) => isNoteModified = true,
                          labelText: 'note_description'.tr(),
                          textFieldHeight: 2,
                          maxLines: null,
                          minLines: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.keyboard_double_arrow_left_rounded,
                        size: 25,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Spacer(),
                    Padding(
                      padding: EdgeInsetsDirectional.only(top: 5.h, end: 15.w),
                      child: DurationTime(
                        duration: runningTime +
                            (note == null ? Duration.zero : note!.elapsedTime),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<HomeViewmodel, HomeViewmodelState>(
        builder: (context, state) {
          if (state.isGetNoteByIdLoading || state.isGetNoteByIdFailed) {
            return const SizedBox();
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// if note is [null] this mean first time create the note
              /// else this mean update note
              note == null
                  ? FilledButton(
                      onPressed: () {
                        if (titleController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty) {
                          var newNote = NoteModel(
                            id: DateTime.now()
                                .millisecondsSinceEpoch
                                .toString(),
                            title: titleController.text,
                            body: descriptionController.text,
                            createdAt: DateTime.now(),
                          );
                          HomeViewmodel.get(context).addNote(newNote);
                          isNoteModified = false;
                        } else {
                          showSnackBar(
                            context,
                            message: 'note_title_and_description'.tr(),
                          );
                        }
                      },
                      child: Text(
                        'add_task'.tr(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  : isNoteModified
                      ? FilledButton(
                          onPressed: () {
                            if (titleController.text.isNotEmpty &&
                                descriptionController.text.isNotEmpty) {
                              var newNote = note!.copyWith(
                                title: titleController.text,
                                body: descriptionController.text,
                                updatedAt: DateTime.now(),
                                elapsedTime: runningTime + note!.elapsedTime,
                                status: note!.status,
                              );
                              HomeViewmodel.get(context)
                                  .updateNote(note!, newNote);
                              isNoteModified = false;
                            } else {
                              showSnackBar(
                                context,
                                message: 'note_title_and_description'.tr(),
                              );
                            }
                          },
                          child: Text(
                            'update'.tr(),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
                      : const SizedBox(),
              SizedBox(width: AppMetrices.widthSpace.h),
              note != null
                  ? note!.status == NoteStatus.none ||
                          note!.status == NoteStatus.paused
                      ? IconButton(
                          iconSize: 25,
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            HomeViewmodel.get(context)
                                .updateNoteAndTotalEstimatedTime(
                              note!,
                              NoteStatus.inprogress,
                              runningTime,
                            );
                            // 2: reset running time
                            runningTime = Duration.zero;
                          },
                          icon: const Icon(
                            Icons.play_circle_outlined,
                          ),
                        )
                      : IconButton(
                          iconSize: 25,
                          style: IconButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            HomeViewmodel.get(context)
                                .updateNoteAndTotalEstimatedTime(
                              note!,
                              NoteStatus.paused,
                              runningTime,
                            );
                            // 2: reset running time
                            runningTime = Duration.zero;
                          },
                          icon: const Icon(
                            Icons.pause_circle_outline,
                          ),
                        )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}
