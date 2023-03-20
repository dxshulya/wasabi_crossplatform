import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:wasabi_crossplatform/data/db/tables/task_table.dart';

part 'database.g.dart';

@DriftDatabase(tables: [TaskTable])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    });
  }

  Future<int?> moviesCount() async {
    var countExp = taskTable.id.count();
    final query = selectOnly(taskTable)..addColumns([countExp]);
    var result = await query.map((row) => row.read(countExp)).getSingle();
    return result;
  }
}
