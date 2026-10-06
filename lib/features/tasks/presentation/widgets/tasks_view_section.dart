import 'package:flutter/material.dart';
import 'package:masar/core/constants/app_options.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_empty_view.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_overview_section.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_sliver_list_view.dart';
import 'package:masar/features/tasks/presentation/widgets/today_tasks_progress_card.dart';

class TasksViewSection extends StatelessWidget {
  const new({
    super.key,
    required this.incompletedTasks,
    required this.completedTasks,
  });
  final List<TaskModel> incompletedTasks;
  final List<TaskModel> completedTasks;

  @override
  Widget build(BuildContext context) {
    if (incompletedTasks.isNotEmpty && completedTasks.isNotEmpty) {
      return CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ScreenTitle(
              hasSelectionMode: true,
              isSelectMode: false,
              title: "المهام",
              hasOptions: true,
              addItemScreenPath: AppRoutes.addTask,
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),
          SliverToBoxAdapter(
            child: TasksOverviewSection(
              completedTasks: completedTasks.length,
              tasksWithHighPriority: incompletedTasks
                  .where(
                    (element) =>
                        element.priority == AppOptions.high &&
                        !element.isCompleted,
                  )
                  .length,
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),

          SliverToBoxAdapter(
            child: TodayTasksProgressCard(
              completedTasks: completedTasks.length,
              inCompleteTasks: incompletedTasks.length,
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),
          incompletedTasks.isNotEmpty
              ? SliverMainAxisGroup(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        "المهام غير المكتملة",
                        style: AppStyles.primaryRegular14,
                      ),
                    ),
                    const SliverToBoxAdapter(child: AppSizes.h10),
                    TasksSliverListView(tasks: incompletedTasks.toList()),
                  ],
                )
              : const SliverToBoxAdapter(),
          completedTasks.isNotEmpty
              ? SliverMainAxisGroup(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Text(
                        "المهام السابقة",
                        style: AppStyles.primaryRegular14,
                      ),
                    ),
                    const SliverToBoxAdapter(child: AppSizes.h10),
                    TasksSliverListView(tasks: completedTasks),
                  ],
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
        ],
      );
    } else {
      return const TasksEmptyView();
    }
  }
}
