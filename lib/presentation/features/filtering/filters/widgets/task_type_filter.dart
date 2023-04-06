import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/filters/conditions/tasks/task_by_type_condition.dart';
import 'package:wasabi_crossplatform/domain/models/filters/task_filter_source.dart';
import 'package:wasabi_crossplatform/domain/models/filters/tasks/task_future_list_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/types/enum_type_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/types/named_enum_type.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_event.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/bloc/filters_state.dart';

class TaskTypeFilter extends StatefulWidget {
  const TaskTypeFilter({Key? key}) : super(key: key);

  @override
  State<TaskTypeFilter> createState() => TaskTypeFilterState();
}

class TaskTypeFilterState extends State<TaskTypeFilter>
    implements TaskFilterSource {
  final List<EnumTypeFilter> _cast = <EnumTypeFilter>[
    ...EnumType.values.map((t) => EnumTypeFilter(t.typeToString()))
  ];

  Iterable<Widget> get actorWidgets {
    return _cast.map((EnumTypeFilter type) {
      final currentFilters = [
        ...context.read<FiltersBloc>().state.selectedTypes
      ];

      return Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
            label: Text(type.name),
            selected: currentFilters.contains(type.name),
            onSelected: (bool value) {
              if (value) {
                currentFilters.add(type.name);
              } else {
                currentFilters.removeWhere((String name) => name == type.name);
              }
              context
                  .read<FiltersBloc>()
                  .add(ChangeTypeFilterEvent(selectedType: currentFilters));
            }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<FiltersBloc, FiltersState>(
        buildWhen: (oldState, newState) =>
            oldState.selectedTypes != newState.selectedTypes,
        builder: (context, state) => Row(
          children: actorWidgets.toList(),
        ),
      ),
    );
  }

  @override
  AbstractFilter<Future<List<AbstractTask>>> filter() {
    final currentFilters = context.read<FiltersBloc>().state.selectedTypes;
    if (currentFilters.isEmpty) {
      return TaskFutureListFilter.empty();
    }

    var taskConditions = currentFilters.map((t) => TaskTypeEqualsCondition(t));
    return TaskFutureListFilter.anyCondition(taskConditions);
  }

  @override
  void reset() {
    context
        .read<FiltersBloc>()
        .add(const ChangeTypeFilterEvent(selectedType: []));
  }
}
