import 'package:equatable/equatable.dart';
import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

abstract class FilteringEvent extends Equatable {
  const FilteringEvent();

  @override
  List<Object> get props => [];
}

class ApplyFilterEvent extends FilteringEvent {
  final AbstractFilter<Future<List<AbstractTask>>> filter;

  const ApplyFilterEvent({required this.filter});

  @override
  List<Object> get props => [filter];
}
