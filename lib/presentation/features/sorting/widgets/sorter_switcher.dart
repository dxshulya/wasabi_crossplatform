import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_event.dart';
import 'package:wasabi_crossplatform/presentation/features/sorting/bloc/sorting_state.dart';

class SorterSwitcher extends StatelessWidget {
  const SorterSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<SortingBloc, SortingState>(
        buildWhen: (oldState, newState) =>
            oldState.isReverseSorting != newState.isReverseSorting,
        builder: (context, state) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 400),
            firstChild: const Icon(Icons.filter_list_rounded),
            secondChild: const Icon(Icons.filter_list_off_rounded),
            crossFadeState: state.isReverseSorting == true
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          );
        },
      ),
      onPressed: () {
        context.read<SortingBloc>().add(ChangeSortDirectionEvent());
      },
    );
  }
}
