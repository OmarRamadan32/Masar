import 'package:flutter/material.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_list_view.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_overview_section.dart';
import 'package:masar/features/tasks/presentation/widgets/today_tasks_progress_card.dart';

class TasksScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      canPop: false,
      child: Column(
        children: [
          ScreenTitle(
            title: "المهام",
            hasOptions: true,
            addItemScreenPath: AppRoutes.addTask,
          ),
          AppSizes.h10,
          TasksOverviewSection(),
          AppSizes.h10,
          TodayTasksProgressCard(),
          AppSizes.h10,
          Expanded(child: TasksListView()),
        ],
      ),
    );
  }
}
