abstract class DatabaseService {
  Future<void> init();
  List<T> getAll<T>(String boxName);
  Future<void> add<T>(String boxName, T item);
}