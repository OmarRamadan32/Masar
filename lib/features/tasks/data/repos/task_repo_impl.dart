import 'package:masar/core/constants/hive_constants.dart';
import 'package:masar/core/database/datebase_service.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/data/repos/tasks_repo.dart';

class TaskRepoImpl implements TasksRepo {
  final DatabaseService databaseService;
  TaskRepoImpl({required this.databaseService});
  static const boxName = HiveConstants.tasksBox;
  @override
  Future<void> addTask({required TaskModel task}) async {
    await databaseService.add<TaskModel>(boxName, task);
  }

  @override
  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  @override
  List<TaskModel> getTasks() {
   return databaseService.getAll<TaskModel>(boxName);
  }

  @override
  Future<void> updateTask({required TaskModel task})async {
    await task.save();
  }

  @override
  Future<void> deleteTasks({required List<TaskModel> tasks})async {
    for (var task in tasks) {
     await task.delete();
    }
  }
}
