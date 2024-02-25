import 'package:better_one/config/generate_router.dart';
import 'package:better_one/view/widgets/modify_card_note.dart';
import 'package:better_one/view_models/home_viewmodel/home_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageStorageKey listKey = const PageStorageKey('list_view');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 25.h, bottom: 5.h),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BlocBuilder<HomeViewmodel, HomeViewmodelState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state.isFailed) {
                  return Center(
                    child: Text(state.errorMessage!),
                  );
                } else {
                  return state.notes.isEmpty
                      ? Center(
                          child: Text('no_task'.tr()),
                        )
                      : ListView.builder(
                          key: listKey,
                          itemCount: state.notes.length,
                          itemBuilder: (context, index) {
                            return ModifiyCardNote(
                              key: ValueKey("${state.notes[index].id}"),
                              onRemove: () {
                                HomeViewmodel.get(context).removeNote(index);
                              },
                              note: state.notes[index],
                            );
                          },
                        );
                }
              },
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  GenerateRouter.noteScreen,
                );
              },
              icon: const Icon(Icons.add, color: Colors.white),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
              label: Text(
                'create_task'.tr(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
