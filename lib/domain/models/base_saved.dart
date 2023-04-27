import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class BaseSaved implements AbstractSaves {
  const BaseSaved({
    required List<AbstractTask> saves,
    required int totalCount,
    required int totalPages,
  })  : _saves = saves,
        _totalCount = totalCount,
        _totalPages = totalPages;

  BaseSaved.empty() : this(saves: [], totalCount: 0, totalPages: 0);

  @override
  List<AbstractTask> get saves => _saves;
  final List<AbstractTask> _saves;

  @override
  int get totalCount => _totalCount;
  final int _totalCount;

  @override
  int get totalPages => _totalPages;
  final int _totalPages;
}
