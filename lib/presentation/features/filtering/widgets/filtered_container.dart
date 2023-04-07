import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/bloc/filtering_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/bloc/filtering_event.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/bloc/filtering_state.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/widgets/modal_bottom_sheet.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/widgets/sorting_container.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class FilteredContainer extends StatefulWidget {
  const FilteredContainer({Key? key}) : super(key: key);

  @override
  State<FilteredContainer> createState() => _FilteredContainerState();
}

class _FilteredContainerState extends State<FilteredContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<FilteringBloc, FilteringState>(
          buildWhen: (oldState, newState) =>
              oldState.filteredTasks != newState.filteredTasks ||
              oldState.filter != newState.filter,
          builder: (context, state) => SortedContainer(
            tasks: state.filteredTasks,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) {
                    return ModalBottomSheet(_applyFilter);
                  });
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 4),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.filter_alt_rounded),
                Text(
                  context.locale.filters.title,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _applyFilter(AbstractFilter<Future<List<AbstractTask>>> filter) async {
    context.read<FilteringBloc>().add(ApplyFilterEvent(filter: filter));
  }
}
