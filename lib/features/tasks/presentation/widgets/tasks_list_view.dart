import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/utils/popup_utils.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item.dart';

class TasksListView extends StatefulWidget {
  const new({super.key,  this.categoryName});
  final String? categoryName;

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  void initState() {
    context.read<TasksCubit>().getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasksList = context.read<TasksCubit>().tasksList;
    List<TaskModel> sortedTasks = widget.categoryName == null ? [] : tasksList.where((task) => task.category?.name == widget.categoryName).toList();
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        if (state is TasksLoaded) {
          if (sortedTasks.isNotEmpty) {
            return ListView.builder(
              itemCount: sortedTasks.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPressStart: (LongPressStartDetails details) {
                    PopupMenuUtils.openOptions(
                      context,
                      details,
                      editText: "تعديل",
                      deleteText: "حذف",
                      onEdit: () {},
                      onDelete: () {
                        context.read<TasksCubit>().deleteTask(
                          task: sortedTasks[index],
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TaskItem(task: sortedTasks[index]),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('لا يوجد مهام'));
          }
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
