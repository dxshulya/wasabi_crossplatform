import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_event.dart';
import 'package:wasabi_crossplatform/data/repositories/tasks/api_tasks_repository.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/repositories/tasks/abstract_tasks_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/tasks_list.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({Key? key}) : super(key: key);

  static const String navigationPath = '/tasks';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
      lazy: false,
      create: (context) => ErrorBloc(context: context),
      child: RepositoryProvider<AbstractTasksRepository>(
        lazy: false,
        create: (context) => ApiTasksRepository(
          apiService: ApiService(
            onErrorHandler: (String code, String message,
                String error) {
              context.read<ErrorBloc>().add(
                ShowDialogEvent(
                  title: code,
                  message: message,
                  error: error,
                ),
              );
            },
          ),
        ),
        child: BlocProvider<SortingBloc>(
          lazy: false,
          create: (context) => SortingBloc(
            sortByReverse: false,
          ),
          child: BlocProvider<TasksBloc>(
            lazy: false,
            create: (context) => TasksBloc(
              repository:
              context.read<AbstractTasksRepository>(),
            ),
            child: const TasksList(),
          ),
        ),
      ),
    );
  }
}
