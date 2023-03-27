import 'package:equatable/equatable.dart';

abstract class ErrorEvent extends Equatable {
  const ErrorEvent();

  @override
  List<Object> get props => [];
}

class ShowDialogEvent extends ErrorEvent {
  final String? title;
  final String? message;
  final String? error;

  const ShowDialogEvent({this.title, required this.message, this.error});

  @override
  List<Object> get props => [title ?? 0, message ?? 0];
}
