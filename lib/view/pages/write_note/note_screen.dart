import 'package:better_one/config/generate_router.dart';
import 'package:better_one/core/utils/dependency_locator/dependency_injection.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/core/utils/shared_widgets/note_field.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/model/notification_model/notification_model.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';

import '../../../core/constants/constants.dart';

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
    super.dispose();
  }

  @override
  void deactivate() {
    HomeViewmodel.get(context).release();
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
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            SizedBox(height: AppMetrices.heightSpace.h),
            BlocConsumer<HomeViewmodel, HomeViewmodelState>(
              listener: (context, state) {
                if (state.isGetNoteByIdCompleted) {
                  note = state.noteById;
                  titleController.text = state.noteById!.title!;
                  descriptionController.text = state.noteById!.body;
                }
                String? id;
                if (state.isNoteUpdateCompleted) {
                  id = state.updatedNote!.id;
                }
                if (state.isNoteAddCompleted) {
                  id = state.addedNote!.id;
                }
                if (id != null) {
                  localNotification.display(
                    notification: NotificationModel(
                      id: DateTime.now().microsecond,
                      title: 'note_motive'.tr(),
                      body: titleController.text,
                      payload: id,
                    ),
                  );
                  Navigator.pop(context);
                }
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
                  Logger().e(state.errorMessage);
                  return Center(
                    child: Failed(
                      failedAsset: LottieAssets.searchForNoteFailed,
                      retry: () {
                        HomeViewmodel.get(context).getNoteById(noteId!);
                      },
                    ),
                  );
                }
                return SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          AppImages.homeBackground,
                        ),
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          SizedBox(height: AppMetrices.heightSpace2.h),
                          BlocBuilder<QuoteViewmode, QuoteViewmodelState>(
                            builder: (context, state) {
                              if (state.quote == null) {
                                return const SizedBox();
                              }
                              return AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  color: AppColors.coolPrimary,
                                  padding: EdgeInsets.all(10.w),
                                  width: double.infinity,
                                  child: Text(
                                    state.quote!.content!,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontStyle: FontStyle.italic,
                                          fontFamily: "Tajawal",
                                        ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(height: AppMetrices.heightSpace2.h),
                          NoteField(
                            controller: titleController,
                            hintText: 'note_title'.tr(),
                            labelText: 'note_title'.tr(),
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'note_title'.tr();
                              }
                              return null;
                            },
                            textFieldHeight: 1,
                            maxLines: null,
                            minLines: 1,
                            prefixIcon:
                                const Icon(Icons.task, color: Colors.blue),
                          ),
                          SizedBox(height: AppMetrices.heightSpace.h),
                          Divider(
                            color: AppColors.white,
                            thickness: 2,
                            height: 10,
                            indent: AppMetrices.widthSpace2.w,
                          ),
                          SizedBox(height: AppMetrices.heightSpace.h),
                          NoteField(
                            controller: descriptionController,
                            hintText: 'note_description'.tr(),
                            labelText: 'note_description'.tr(),
                            validator: (text) {
                              if (text!.isEmpty) {
                                return 'note_description'.tr();
                              }
                              return null;
                            },
                            textFieldHeight: 2,
                            maxLines: null,
                            minLines: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.keyboard_double_arrow_left_rounded,
                color: AppColors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<HomeViewmodel, HomeViewmodelState>(
        builder: (context, state) {
          if (state.isGetNoteByIdLoading || state.isGetNoteByIdFailed) {
            return const SizedBox();
          }
          return ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                var newNote = note == null
                    ? NoteModel(
                        id: DateTime.now().millisecondsSinceEpoch.toString(),
                        title: titleController.text,
                        body: descriptionController.text,
                        createdAt: DateTime.now(),
                      )
                    : note!.copyWith(
                        title: titleController.text,
                        body: descriptionController.text,
                        updatedAt: DateTime.now(),
                      );
                note == null
                    ? HomeViewmodel.get(context).addNote(newNote)
                    : HomeViewmodel.get(context).updateNote(note!, newNote);
              }
            },
            child: Text(
              'do_it'.tr(),
            ),
          );
        },
      ),
    );
  }
}
