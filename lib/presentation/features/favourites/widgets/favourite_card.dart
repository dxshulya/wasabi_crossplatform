import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/mappers/db/db_data_mapper.dart';
import 'package:wasabi_crossplatform/domain/repositories/abstract_favourites_tasks_repository.dart';
import 'package:wasabi_crossplatform/presentation/common/favourites_checked_button.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_event.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/widgets/models/favourite_card_model.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class FavouriteCard extends StatelessWidget {
  const FavouriteCard(
      {required FavouriteCardModel model, required int index, Key? key})
      : _model = model,
        _index = index,
        super(key: key);

  final FavouriteCardModel _model;
  final int _index;

  @override
  Widget build(BuildContext context) {
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
            height: 9,
          ),
          Text(_model.formula),
          const SizedBox(
            height: 16,
          ),
          Text(_model.task),
          const SizedBox(
            height: 16,
          ),
          Text("${context.locale.tasks.answer} ${_model.answer}"),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
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
