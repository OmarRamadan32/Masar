import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/utils/popup_utils.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item.dart';

class TasksSliverListView extends StatelessWidget {
  const new({super.key, required this.tasks});
  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPressStart: (LongPressStartDetails details) {
            PopupMenuUtils.openOptions(
              context,
              details,
              editText: "تعديل",
              deleteText: "حذف",
              onEdit: () {
                context.push(AppRoutes.editTask, extra: tasks[index]);
              },
              onDelete: () {
                context.read<TasksCubit>().deleteTask(task: tasks[index]);
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TaskItem(task: tasks[index]),
          ),
        );
      },
    );
  }
}
