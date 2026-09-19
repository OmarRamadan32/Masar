import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(AppRoutes.task);
          },
          child: const TaskItem(),
        );
      },
    );
  }
}
