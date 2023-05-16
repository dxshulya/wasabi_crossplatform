import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/presentation/common/empty.dart';
import 'package:wasabi_crossplatform/presentation/common/error.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_event.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_state.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/widgets/mappers/task_domain_to_saved_card_model.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/widgets/saved_card.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/pages/settings_page.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class SavedList extends StatefulWidget {
  const SavedList({Key? key}) : super(key: key);

  @override
  State<SavedList> createState() => _SavedListState();
}

class _SavedListState extends State<SavedList> {
  late final ScrollController _scrollController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (currentScroll == maxScroll) {
      context.read<SavedBloc>().add(const SavedFetch());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.locale.saved.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SettingsPage.navigationPath,
              );
            },
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {
        return state.status == SavedStatus.initial
            ? const Center(child: Center(child: CircularProgressIndicator()))
            : state.status == SavedStatus.success
                ? state.data.saves.isNotEmpty == true
                    ? RefreshIndicator(
                        onRefresh: () async {
                          context.read<SavedBloc>().add(const SavedRefresh());
                        },
                        child: ListView.builder(
                          controller: _scrollController,
                          itemBuilder: (BuildContext context, int index) {
                            final model =
                                state.data.saves[index].toSavedCardModel();

                            if (model.id.isNotEmpty) {
                              return SavedCard(
                                index: index + 1,
                                model: model,
                              );
                            }

                            return const ErrorHelper();
                          },
                          itemCount: state.data.saves.length,
                        ),
                      )
                    : const EmptyHelper()
                : const ErrorHelper();
      }),
      floatingActionButton: FloatingActionButton(
          child: const RotatedBox(
            quarterTurns: 1,
            child: Icon(
              Icons.arrow_back_rounded,
            ),
          ),
          onPressed: () {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              _scrollController.animateTo(
                  _scrollController.position.minScrollExtent ?? 0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.fastOutSlowIn);
            });
          }),
    );
  }
}
