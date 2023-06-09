import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';
import 'package:wasabi_crossplatform/presentation/common/empty.dart';
import 'package:wasabi_crossplatform/presentation/common/error.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/pages/favourites_page.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/bloc/filtering_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/widgets/filtered_container.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/pages/saved_page.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/pages/settings_page.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/widgets/sorter_switcher.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_event.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_state.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    context.read<TasksBloc>().add(LoadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TasksBloc>();

    return Scaffold(
      appBar: AppBar(
        leading: const SorterSwitcher(),
        title: Text(context.locale.tasks.title),
        actions: [
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) => IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SavedPage.navigationPath,
                );
              },
              icon: StreamBuilder<AbstractTotalCount>(
                stream: bloc.counter,
                builder: (BuildContext context,
                    AsyncSnapshot<AbstractTotalCount?> data) {
                  return Badge(
                    backgroundColor: AppColors.brandGreenColor,
                    label: Text(data.data?.totalCount.toString() ?? '0'),
                    isLabelVisible:
                        (data.data?.totalCount ?? 0) < 1 ? false : true,
                    child: const Icon(Icons.save_rounded),
                  );
                },
              ),
            ),
          ),
          BlocBuilder<FavouritesBloc, FavouritesState>(
            buildWhen: (oldState, newState) => oldState.tasks != newState.tasks,
            builder: (context, state) => IconButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  FavouritesPage.navigationPath,
                );
              },
              icon: Badge(
                backgroundColor: AppColors.brandRedColor,
                label: Text(state.tasks.length.toString()),
                isLabelVisible: state.tasks.isEmpty ? false : true,
                child: const Icon(Icons.favorite_rounded),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SettingsPage.navigationPath,
              );
            },
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: BlocBuilder<TasksBloc, TasksState>(
        buildWhen: (oldState, newState) => oldState.data != newState.data,
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: Builder(builder: (context) {
              _scrollController ??= PrimaryScrollController.of(context)
                ..addListener(_pagination);
              return FutureBuilder<AbstractTasks>(
                future: state.data,
                builder:
                    (BuildContext context, AsyncSnapshot<AbstractTasks?> data) {
                  return data.connectionState != ConnectionState.done
                      ? const Center(
                          child: Center(child: CircularProgressIndicator()))
                      : data.hasData
                          ? data.data?.tasks.isNotEmpty == true
                              ? BlocProvider<FilteringBloc>(
                                  lazy: false,
                                  create: (context) => FilteringBloc(
                                    sourceTasks: data.data?.tasks ?? [],
                                  ),
                                  child: const FilteredContainer(),
                                )
                              : const EmptyHelper()
                          : const ErrorHelper();
                },
              );
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_back_rounded,
            ),
          ),
          onPressed: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              _scrollController?.animateTo(
                  _scrollController?.position.minScrollExtent ?? 0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn);
            });
          }),
    );
  }

  Future<void> _onRefresh() async {
    context.read<TasksBloc>().add(LoadDataEvent());
  }

  static const int _paginationOffset = 200;

  void _pagination() {
    // if (((_scrollController?.position.pixels ?? 0) >=
    //     (_scrollController?.position.maxScrollExtent ??
    //         0 - _paginationOffset))) {
    //   context.read<TasksBloc>().add(LoadDataEvent());
    // }
  }
}
