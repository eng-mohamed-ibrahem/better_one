import 'package:better_one/config/navigation/routes_enum.dart';
import 'package:better_one/core/constants/lottie_assets.dart';
import 'package:better_one/core/debouncing/timer_debouncing.dart';
import 'package:better_one/core/utils/shared_widgets/back_button_l10n.dart';
import 'package:better_one/core/utils/shared_widgets/failed.dart';
import 'package:better_one/core/utils/shared_widgets/lottie_indicator.dart';
import 'package:better_one/view/widgets/input_field/task_field.dart';
import 'package:better_one/view/widgets/task/card_task.dart';
import 'package:better_one/view_models/search_viewmodel/search_viewmodel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TimerDebouncing _debouncing;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    _debouncing = TimerDebouncing();
    super.initState();
  }

  @override
  void dispose() {
    _debouncing.cancel();
    _controller.dispose();
    super.dispose();
  }

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
          controller: _controller,
          autofocus: true,
          onChanged: (text) {
            _debouncing.call(() {
              context.read<SearchViewmodel>().search(text.trim());
            });
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(Routes.searchSetting.name);
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(15.h),
          child: const SizedBox.shrink(),
        ),
      ),
      body: BlocBuilder<SearchViewmodel, SearchViewmodelState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              return Center(
                child: Text(
                  "search.init".tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
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
                      child: Text('search.empty'.tr()),
                    )
                  : CustomScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      slivers: [
                        SliverList.builder(
                          itemCount: searchedTasks.length,
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
                    context
                        .read<SearchViewmodel>()
                        .search(_controller.text.trim());
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
