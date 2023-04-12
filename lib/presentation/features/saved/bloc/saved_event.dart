import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class SavedEvent extends Equatable {
  const SavedEvent();

  @override
  List<Object> get props => [];
}

class PageChangedEvent extends SavedEvent {
  final int page;

  const PageChangedEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class ChangedLikedEvent extends SavedEvent {
  final AbstractTask model;

  const ChangedLikedEvent({required this.model});
}


class SavedFetch extends SavedEvent {
  const SavedFetch();
}

class SavedRefresh extends SavedEvent {
  const SavedRefresh();
}