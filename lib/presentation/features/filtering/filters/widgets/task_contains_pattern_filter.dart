import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/filters/conditions/tasks/task_contains_pattern_condition.dart';
import 'package:wasabi_crossplatform/domain/models/filters/task_filter_source.dart';
import 'package:wasabi_crossplatform/domain/models/filters/tasks/task_future_list_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_event.dart';

class TaskContainsPatternFilter extends StatefulWidget {
  const TaskContainsPatternFilter({Key? key}) : super(key: key);

  @override
  State<TaskContainsPatternFilter> createState() =>
      TaskContainsPatternFilterState();
}

class TaskContainsPatternFilterState extends State<TaskContainsPatternFilter>
    implements TaskFilterSource {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.text = context.read<FiltersBloc>().state.textPattern;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onSearchFieldTextChanged,
      autofocus: false,
    );
  }

  void _onSearchFieldTextChanged(String text) {
    context
        .read<FiltersBloc>()
        .add(ChangeFilterPatternEvent(textPattern: text));
  }

  @override
  void reset() {
    _controller.value = TextEditingValue.empty;
    context
        .read<FiltersBloc>()
        .add(const ChangeFilterPatternEvent(textPattern: ""));
  }

  @override
  AbstractFilter<Future<List<AbstractTask>>> filter() {
    final currentText = context.read<FiltersBloc>().state.textPattern;
    if (currentText.isEmpty) {
      return TaskFutureListFilter.empty();
    }

    return TaskFutureListFilter.condition(
      TaskContainsPatternCondition(currentText),
    );
  }
}
