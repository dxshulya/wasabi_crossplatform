import 'package:wasabi_crossplatform/domain/models/saved/abstract_saves.dart';

abstract class AbstractSavedRepository {
  Future<AbstractSaves> fetchSaves(int page);
}