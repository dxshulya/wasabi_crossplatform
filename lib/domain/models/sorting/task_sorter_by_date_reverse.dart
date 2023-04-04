import 'package:wasabi_crossplatform/domain/models/sorting/sorter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';

class TaskSorterByDateReverse implements Sorter<AbstractTask> {
  @override
  List<AbstractTask> sort(Iterable<AbstractTask> source) {
    return source.toList()
      ..sort(
        (a, b) => b.datetime.compareTo(a.datetime),
      );
  }
}
