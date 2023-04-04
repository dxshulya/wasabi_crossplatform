import 'package:wasabi_crossplatform/domain/models/sorting/sorter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class TaskSorterByDate implements Sorter<AbstractTask> {
  @override
  List<AbstractTask> sort(Iterable<AbstractTask> source) {
    return source.toList()
      ..sort(
        (a, b) => a.datetime.compareTo(b.datetime),
      );
  }
}
