import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/presentation/common/saved_checked_button.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/widgets/models/saved_card_model.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';

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
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(right: 4),
              //     child: OutlinedButton(
              //       onPressed: () {},
              //       style: OutlinedButton.styleFrom(
              //         elevation: 0,
              //         side: BorderSide(
              //             width: 1.0, color: AppColors.brandGreenColor),
              //         shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10),
              //         ),
              //         padding: const EdgeInsets.only(
              //             left: 0, right: 0, top: 0, bottom: 0),
              //         backgroundColor: Colors.transparent,
              //         foregroundColor: AppColors.lightColorSchemeSeed,
              //       ),
              //       child: Icon(
              //         Icons.save_rounded,
              //         color: AppColors.brandGreenColor,
              //       ),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: SavedCheckedButton(
                    alignment: Alignment.centerRight,
                    initialChecked: false,
                    onPressed: () {},
                  ),
                ),
              ),
              // Expanded(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 4),
              //     child: BlocBuilder<FavouritesBloc, FavouritesState>(
              //       builder: (context, state) => FavoritesCheckedButton(
              //         alignment: Alignment.centerRight,
              //         initialChecked: context
              //             .read<AbstractFavouritesTasksRepository>()
              //             .checkForFavouriteById(_model.id),
              //         onPressed: () {
              //           context.read<FavouritesBloc>().add(
              //                 ChangedFavourite(
              //                   model: _model.toDomain(),
              //                 ),
              //               );
              //         },
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
