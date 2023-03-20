import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_tasks.dart';
import 'package:wasabi_crossplatform/presentation/common/empty.dart';
import 'package:wasabi_crossplatform/presentation/common/error.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/pages/favourites_page.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/pages/saved_page.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/pages/settings_page.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_event.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_state.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/mappers/task_domain_to_task_card_model.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/task_card.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  static const String navigationPath = '/tasks';

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    context.read<TasksBloc>().add(LoadDataEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.tasks.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SavedPage.navigationPath,
              );
            },
            icon: Icon(Icons.save),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                FavouritesPage.navigationPath,
              );
            },
            icon: Icon(Icons.favorite_rounded),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SettingsPage.navigationPath,
              );
            },
            icon: Icon(Icons.settings),
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
                  builder: (BuildContext context,
                      AsyncSnapshot<AbstractTasks?> data) {
                    return data.connectionState != ConnectionState.done
                        ? const Center(
                            child: Center(child: CircularProgressIndicator()))
                        : data.hasData
                            ? data.data?.tasks.isNotEmpty == true
                                ? Expanded(
                                    child: ListView.builder(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final model = data.data?.tasks[index]
                                            .toTaskCardModel();

                                        if (model != null) {
                                          return TaskCard(
                                            index: index + 1,
                                            model: model,
                                          );
                                        }

                                        return const ErrorHelper();
                                      },
                                      itemCount: data.data?.tasks.length ?? 0,
                                    ),
                                  )
                                : const EmptyHelper()
                            : const ErrorHelper();
                  },
                );
              }));
        },
      ),
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