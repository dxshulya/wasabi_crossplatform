import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:wasabi_crossplatform/domain/models/filters/abstract_filter.dart';
import 'package:wasabi_crossplatform/domain/models/filters/tasks/task_future_list_filter.dart';
import 'package:wasabi_crossplatform/domain/models/tasks/abstract_task.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/widgets/task_contains_pattern_filter.dart';
import 'package:wasabi_crossplatform/presentation/features/filtering/filters/widgets/task_type_filter.dart';
import 'package:wasabi_crossplatform/utils/colors.dart';
import 'package:wasabi_crossplatform/utils/locals/locals.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet(this._onApply, {Key? key}) : super(key: key);
  final void Function(AbstractFilter<Future<List<AbstractTask>>>) _onApply;

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet>
    with AutomaticKeepAliveClientMixin {
  final GlobalKey<TaskTypeFilterState> _keyTypeFilter = GlobalKey();
  final GlobalKey<TaskContainsPatternFilterState> _keyTextContainsFilter =
      GlobalKey();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      margin: const EdgeInsets.all(12),
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.locale.filters.byTask),
                      TaskContainsPatternFilter(key: _keyTextContainsFilter),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context.locale.filters.byType),
                      TaskTypeFilter(key: _keyTypeFilter),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: OutlinedButton(
                            onPressed: resetFilters,
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                              side: BorderSide(
                                  width: 1.0, color: AppColors.brandRedColor),
                              foregroundColor: AppColors.lightColorSchemeSeed,
                            ),
                            child: Text(
                              context.locale.filters.reset,
                              style: TextStyle(
                                color: AppColors.brandRedColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: OutlinedButton(
                            onPressed: onPressedApply,
                            style: OutlinedButton.styleFrom(
                              elevation: 0,
                              side: const BorderSide(
                                  width: 1.0, color: Colors.white),
                              foregroundColor: AppColors.lightColorSchemeSeed,
                              backgroundColor: AppColors.brandGreenColor,
                            ),
                            child: Text(
                              context.locale.filters.apply,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> onPressedApply() async {
    var typeFilter = _keyTypeFilter.currentState?.filter();
    var textContainsFilter = _keyTextContainsFilter.currentState?.filter();

    var filters = [
      textContainsFilter,
      typeFilter,
    ].whereNotNull().toList();
    var resultFilter = TaskFutureListFilter(filters);
    widget._onApply(resultFilter);
  }

  void resetFilters() {
    setState(() {
      _keyTypeFilter.currentState?.reset();
      _keyTextContainsFilter.currentState?.reset();
    });
  }
}
