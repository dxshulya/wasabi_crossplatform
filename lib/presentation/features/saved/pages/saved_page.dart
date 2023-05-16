import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_bloc.dart';
import 'package:wasabi_crossplatform/blocs/error_bloc/error_event.dart';
import 'package:wasabi_crossplatform/data/repositories/saved/api_saved_repository.dart';
import 'package:wasabi_crossplatform/data/services/api/api_service.dart';
import 'package:wasabi_crossplatform/domain/repositories/saved/abstract_saved_repository.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_bloc.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/bloc/saved_event.dart';
import 'package:wasabi_crossplatform/presentation/features/saved/pages/saved_list.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  static const String navigationPath = '/saved';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
      lazy: false,
      create: (context) => ErrorBloc(context: context),
      child: RepositoryProvider<AbstractSavedRepository>(
        lazy: false,
        create: (context) => ApiSavedRepository(
          apiService: ApiService(
            onErrorHandler: (String code, String message,
                String error) {
              context.read<ErrorBloc>().add(
                ShowDialogEvent(
                  title: code,
                  message: message,
                  error: error,
                ),
              );
            },
          ),
        ),
        child: BlocProvider<SavedBloc>(
          lazy: false,
          create: (context) => SavedBloc(
            repository:
            context.read<AbstractSavedRepository>(),
          )..add(const SavedFetch()),
          child: const SavedList(),
        ),
      ),
    );
  }
}
