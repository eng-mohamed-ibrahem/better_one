import 'package:better_one/core/constants/lottie_assets.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/input_field/task_field.dart';
import 'package:better_one/view/widgets/task/card_task.dart';
import 'package:better_one/view_models/search_viewmodel/search_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const FittedBox(
          fit: BoxFit.scaleDown,
          child: BackButtonl10n(),
        ),
        title: TaskField(
          hintText: "search.hint".tr(),
          onChanged: (text) {
            // use time debouncing here
          },
        ),
      ),
      body: BlocBuilder<SearchViewmodel, SearchViewmodelState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return const SizedBox.shrink(
                child: Text("initial state"),
              );
            },
            searchLoading: () {
              return const Center(
                child: LottieIndicator(
                  statusAssets: LottieAssets.searchForTask,
                ),
              );
            },
            searchCompleted: (searchedTasks) {
              return searchedTasks.isEmpty
                  ? Center(
                      child: Text('task.empty'.tr()),
                    )
                  : CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverList.builder(
                          itemBuilder: (context, index) {
                            return CardTask(
                              key: ValueKey(searchedTasks[index].id),
                              task: searchedTasks[index],
                            );
                          },
                        ),
                      ],
                    );
            },
            searchFailed: (message) {
              return Center(
                child: Failed(
                  failedAsset: LottieAssets.error,
                  errorMessage: message,
                  retry: () {
                    context.read<SearchViewmodel>().search('');
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
