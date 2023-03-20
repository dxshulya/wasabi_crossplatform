import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/presentation/common/empty.dart';
import 'package:wasabi_crossplatform/presentation/common/error.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_event.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_state.dart';
import 'package:wasabi_crossplatform/presentation/features/settings/pages/settings_page.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/mappers/task_domain_to_task_card_model.dart';
import 'package:wasabi_crossplatform/presentation/features/tasks/widgets/task_card.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  static const String navigationPath = '/saved';

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  ScrollController? _scrollController;

  @override
  void didChangeDependencies() {
    context.read<SavedBloc>().add(LoadDataEvent());
    super.didChangeDependencies();
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
            icon: Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: BlocBuilder<SavedBloc, SavedState>(
        buildWhen: (oldState, newState) => oldState.data != newState.data,
        builder: (context, state) {
          return RefreshIndicator(
              onRefresh: _onRefresh,
              child: Builder(builder: (context) {
                _scrollController ??= PrimaryScrollController.of(context)
                  ..addListener(_pagination);
                return FutureBuilder<AbstractSaves>(
                  future: state.data,
                  builder: (BuildContext context,
                      AsyncSnapshot<AbstractSaves?> data) {
                    return data.connectionState != ConnectionState.done
                        ? const Center(
                            child: Center(child: CircularProgressIndicator()))
                        : data.hasData
                            ? data.data?.saves.isNotEmpty == true
                                ? ListView.builder(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      final model = data.data?.saves[index]
                                          .toTaskCardModel();

                                      if (model != null) {
                                        return TaskCard(
                                          index: index + 1,
                                          model: model,
                                        );
                                      }

                                      return const ErrorHelper();
                                    },
                                    itemCount: data.data?.saves.length ?? 0,
                                  )
                                : const EmptyHelper()
                            : const ErrorHelper();
                  },
                );
              }));
        },
      ),
    );
  }

  Future<void> _onRefresh() async {
    context.read<SavedBloc>().add(LoadDataEvent());
  }

  static const int _paginationOffset = 200;

  void _pagination() {
    if (((_scrollController?.position.pixels ?? 0) >=
        (_scrollController?.position.maxScrollExtent ??
            0 - _paginationOffset))) {
      context.read<SavedBloc>().add(NextPageLoadEvent());
    }
  }
}
