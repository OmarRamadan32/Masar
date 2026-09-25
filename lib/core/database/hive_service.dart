import 'package:hive_flutter/hive_flutter.dart';
import 'package:masar/core/constants/hive_constants.dart';
import 'package:masar/core/database/datebase_service.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/notes/data/models/note_model.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';

 class HiveService implements DatabaseService {
  @override
   Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openBoxes();
  }

static void _registerAdapters() {
    Hive.registerAdapter(TaskModelAdapter());
    Hive.registerAdapter(NoteModelAdapter());
    Hive.registerAdapter(CategoryModelAdapter());
  }

static Future<void> _openBoxes() async {
    await Future.wait([
      Hive.openBox<TaskModel>(HiveConstants.tasksBox),
      Hive.openBox<NoteModel>(HiveConstants.notesBox),
      Hive.openBox<CategoryModel>(HiveConstants.categoriesBox),
    ]);
  }
@override
Future<void> add<T>(String boxName, T item) async {
  final box = Hive.box<T>(boxName);
  await box.add(item);
}

@override
List<T> getAll<T>(String boxName)  {
  final box = Hive.box<T>(boxName);
  return box.values.toList();
}
  
}