import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/presentation/common/empty.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/favourites/bloc/favourites_state.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/mappers/task_domain_to_task_card_model.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/task_card.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  static const String navigationPath = '/favourites';

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.favourites.title),
      ),
      body: BlocBuilder<FavouritesBloc, FavouritesState>(
        buildWhen: (oldState, newState) => oldState.tasks != newState.tasks,
        builder: (context, state) {
          if (state.tasks.isEmpty) {
            return const EmptyHelper();
          }

          return Column(
            children: [
              Expanded(
                child: Builder(builder: (context) {
                  _scrollController ??= PrimaryScrollController.of(context);
                  return ListView.builder(
                    controller: _scrollController,
                    itemBuilder: (BuildContext context, int index) {
                      return TaskCard(
                        index: index + 1,
                        model: state.tasks[index].toTaskCardModel(),
                      );
                    },
                    itemCount: state.tasks.length,
                  );
                }),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_back_rounded,
            ),
          ),
          onPressed: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              _scrollController?.animateTo(
                  _scrollController?.position.minScrollExtent ?? 0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn);
            });
          }),
    );
  }
}
