import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
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
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

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
        border: Border.all(color: AppColors.lightColorSchemeSeed),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _index.toString(),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.lightColorSchemeSeed),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(_model.formula),
          const SizedBox(
            height: 16,
          ),
          Text(_model.task),
          const SizedBox(
            height: 8,
          ),
          Text(_model.datetime),
          const SizedBox(
            height: 8,
          ),
          ListTileTheme(
            contentPadding:
                const EdgeInsets.only(top: 0, left: 0, right: 16, bottom: 0),
            child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: Text(
                  context.locale.tasks.answer,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                  ),
                ),
                initiallyExpanded:
                    bloc.state.tasksExpandedIds.contains(_model.id),
                onExpansionChanged: (value) {
                  if (value == false) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    bloc.state.tasksExpandedIds.remove(_model.id);
                  } else {
                    bloc.state.tasksExpandedIds.add(_model.id);
                  }
                },
                childrenPadding: const EdgeInsets.only(
                    left: 4, top: 0, right: 4, bottom: 16),
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      _model.answer,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightColorSchemeSeed),
                    ),
                  ),
                ],
              ),
            ),
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
                                model: _model.toCardModel(),
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
              onPressed: () {
                Share.share(
                    '${_model.formula}\n\n${_model.task}\n\n${_model.answer}');
              },
              style: OutlinedButton.styleFrom(
                elevation: 0,
                side: BorderSide(
                    width: 1.0, color: AppColors.lightColorSchemeSeed),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.only(left: 0, right: 0, top: 4, bottom: 4),
                backgroundColor: Colors.transparent,
                foregroundColor: AppColors.lightColorSchemeSeed,
              ),
              child: Icon(
                Icons.share_rounded,
                color: AppColors.lightColorSchemeSeed,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
