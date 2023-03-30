import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/mappers/db/db_data_mapper.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';
import 'package:wasabi_crossplatform/domain/repositories/abstract_favourites_tasks_repository.dart';
import 'package:wasabi_crossplatform/presentation/common/favourites_checked_button.dart';
import 'package:wasabi_crossplatform/presentation/common/saved_checked_button.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_event.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/bloc/tasks_state.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/models/task_card_model.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({required TaskCardModel model, required int index, Key? key})
      : _model = model,
        _index = index,
        super(key: key);

  final TaskCardModel _model;
  final int _index;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TasksBloc>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightColorSchemeSeed.withOpacity(0.2),
            blurRadius: 1,
            offset: const Offset(0, 0), // Shadow position
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(_index.toString()),
          const SizedBox(
            height: 8,
          ),
          Text(_model.formula),
          const SizedBox(
            height: 16,
          ),
          Text(_model.task),
          const SizedBox(
            height: 16,
          ),
          Text(_model.answer),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: BlocBuilder<TasksBloc, TasksState>(
                    builder: (context, state) =>
                        StreamBuilder<AbstractTotalCount>(
                      stream: bloc.counter,
                      builder: (BuildContext context,
                          AsyncSnapshot<AbstractTotalCount?> data) {
                        return SavedCheckedButton(
                          alignment: Alignment.centerRight,
                          initialChecked:
                              state.tasksSavedIds.contains(_model.id),
                          onPressed: () {
                            context.read<TasksBloc>().add(
                                  ChangedLikedEvent(
                                    model: _model.toDomain(),
                                  ),
                                );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: BlocBuilder<FavouritesBloc, FavouritesState>(
                    builder: (context, state) => FavoritesCheckedButton(
                      alignment: Alignment.centerRight,
                      initialChecked: context
                          .read<AbstractFavouritesTasksRepository>()
                          .checkForFavouriteById(_model.id),
                      onPressed: () {
                        context.read<FavouritesBloc>().add(
                              ChangedFavourite(
                                model: _model.toDomain(),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
