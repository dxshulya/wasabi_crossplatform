import 'package:equatable/equatable.dart';

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

class NextPageLoadEvent extends SavedEvent {}
class PrevPageLoadEvent extends SavedEvent {}

class LoadDataEvent extends SavedEvent {}
