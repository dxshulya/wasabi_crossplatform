import 'package:wasabi_crossplatform/domain/models/tasks/abstract_total_count.dart';

class BaseTotalCount implements AbstractTotalCount {
  BaseTotalCount({
    required int totalCount,
  }) : _totalCount = totalCount;

  BaseTotalCount.empty() : this(totalCount: 0);

  @override
  int get totalCount => _totalCount;
  final int _totalCount;
}
