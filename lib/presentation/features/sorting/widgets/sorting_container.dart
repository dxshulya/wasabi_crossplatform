import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/mappers/db/db_data_mapper.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/common/empty.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_state.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/task_card.dart';

class SortedContainer extends StatelessWidget {
  const SortedContainer({Key? key, required this.tasks}) : super(key: key);
  final List<AbstractTask> tasks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortingBloc, SortingState>(
        buildWhen: (oldState, newState) =>
            oldState.isReverseSorting != newState.isReverseSorting,
        builder: (context, state) {
          final sortedTasks = state.sorter.sort(tasks);
          return (sortedTasks.isNotEmpty
              ? Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              final model = sortedTasks[index];

                              return TaskCard(
                                model: model.toTaskCardModel(),
                                index: index + 1,
                              );
                            },
                            itemCount: sortedTasks.length),
                      ),
                    ],
                  ),
                )
              : const Expanded(
                  child: EmptyHelper(),
                ));
        });
  }
}
