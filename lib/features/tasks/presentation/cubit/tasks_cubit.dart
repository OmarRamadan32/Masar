import 'package:bloc/bloc.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/data/repos/tasks_repo.dart';
import 'package:meta/meta.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  final TasksRepo tasksRepo;
  TasksCubit({required this.tasksRepo}) : super(TasksInitial());
  List<TaskModel> tasksList = [];

  void getTasks()  {
    List<TaskModel> tasks = tasksRepo.getTasks();    
    emit(TasksLoaded(tasks: tasks));
  }
  Future<void> addTask({required TaskModel task}) async {
    await tasksRepo.addTask(task: task);
    getTasks();
  }
  Future<void> updateTask({required TaskModel task}) async {
    await tasksRepo.updateTask(task: task);
    getTasks();
  }
  Future<void> deleteTask({required TaskModel task}) async {
    await tasksRepo.deleteTask(task: task);
    getTasks();
  }
}
