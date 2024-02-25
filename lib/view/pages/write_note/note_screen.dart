import 'dart:developer';

import 'package:better_one/core/constants/app_colors.dart';
import 'package:better_one/core/constants/app_metrices.dart';
import 'package:better_one/model/note_model/note_model.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:better_one/view_models/quote_viewmodel/quote_viewmodel_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late NoteModel? note;

  @override
  void didChangeDependencies() {
    note = ModalRoute.of(context)?.settings.arguments as NoteModel?;
    titleController = TextEditingController(text: note?.title);
    descriptionController = TextEditingController(text: note?.body);

    QuoteViewmode.get(context).getRandomQuote();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    log('building note screen');
    log('${MediaQuery.sizeOf(GetIt.I.get<BuildContext>()).height}');
    log('${(120 / MediaQuery.sizeOf(GetIt.I.get<BuildContext>()).height) * 100}');
    log('${MediaQuery.devicePixelRatioOf(context)}');
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.keyboard_double_arrow_left_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(note?.title ?? 'Thats My Task'),
        bottom: note != null
            ? PreferredSize(
                preferredSize: Size.fromHeight(
                  AppMetrices.heightSpace.h,
                ),
                child: Text(
                  DateFormat('EEEE, MMMM d, yyyy,  hh:mm a',
                          context.locale.languageCode)
                      .format(note!.updatedAt ?? note!.createdAt),
                ),
              )
            : null,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppMetrices.heightSpace.h),
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
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
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
              SizedBox(height: AppMetrices.heightSpace.h),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppMetrices.widthSpace2.w,
                ),
                child: TextFormField(
                  controller: titleController,
                  obscureText: false,
                  minLines: 1,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText:
                        'your task which you will achieve', // مهمتك التي سوف تحققها
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Adjust for desired background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    prefixIcon: const Icon(Icons.task,
                        color: Colors.blue), // Optional icon
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Divider(
                height: 10,
                thickness: 1,
                color: AppColors.coolPrimary,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppMetrices.widthSpace2.w,
                ),
                child: TextFormField(
                  controller: descriptionController,
                  maxLines: null,
                  minLines: 3,
                  decoration: InputDecoration(
                    labelText:
                        'feel free to say what you want to achieve', // لا تتردد في قول ما تريد تحقيقه
                    hintText: 'feel free to say what you want to achieve',
                    filled: true,
                    fillColor:
                        Colors.grey[200], // Adjust for desired background color
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // SamplingClock().stopwatch();
          var newNote = note == null
              ? NoteModel(
                  id: DateTime.now().millisecond,
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
              : HomeViewmodel.get(context).updateNote(
                  HomeViewmodel.get(context).state.notes.indexOf(note!),
                  newNote);

          Navigator.pop(context);
        },
        child: Text(
          'lets_go'.tr(),
        ),
      ),
    );
  }
}
