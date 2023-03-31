import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/data/mappers/db/db_data_mapper.dart';
import 'package:wasabi_crossplatform/presentation/common/saved_checked_button.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_event.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_state.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/widgets/models/saved_card_model.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class SavedCard extends StatelessWidget {
  const SavedCard({required SavedCardModel model, required int index, Key? key})
      : _model = model,
        _index = index,
        super(key: key);

  final SavedCardModel _model;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.lightColorSchemeSeed.withOpacity(0.2),
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
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
                  padding: const EdgeInsets.only(right: 4),
                  child: BlocBuilder<SavedBloc, SavedState>(
                    builder: (context, state) => SavedCheckedButton(
                      alignment: Alignment.centerRight,
                      initialChecked: !state.tasksSavedIds.contains(_model.id),
                      onPressed: () {
                        context.read<SavedBloc>().add(
                              ChangedLikedEvent(
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
