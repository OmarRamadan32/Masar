import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/main_layout/widgets/screen_title.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_overview_section.dart';
import 'package:masar/features/tasks/presentation/widgets/today_tasks_progress_card.dart';

class TasksScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ScreenTitle(title: "المهام"),
        AppSizes.h10,
        TasksOverviewSection(),
        AppSizes.h10,
        TodayTasksProgressCard(),
      ],
    );
  }
}
