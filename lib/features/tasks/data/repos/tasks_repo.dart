import 'package:masar/features/tasks/data/models/task_model.dart';

abstract class TasksRepo {
  Future<void> addTask({required TaskModel task,});
  Future<void> deleteTask({required TaskModel task,});
  Future<void> updateTask({required TaskModel task,});
  List<TaskModel> getTasks();
  
}