import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_list_view.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_overview_section.dart';
import 'package:masar/features/tasks/presentation/widgets/today_tasks_progress_card.dart';

class TasksScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    context.read<TasksCubit>().getTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(builder:
    (context, state) {
      if (state is TasksLoaded) {
        List<TaskModel> tasks = state.tasks;
          return CustomScreen(
      canPop: false,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child:  ScreenTitle(
              title: "المهام",
              hasOptions: true,
              addItemScreenPath: AppRoutes.addTask,
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),

          const SliverToBoxAdapter(child:  TasksOverviewSection()),
          const SliverToBoxAdapter(child: AppSizes.h10),

          const SliverToBoxAdapter(child:  TodayTasksProgressCard()),
          const SliverToBoxAdapter(child: AppSizes.h10),
          TasksSliverListView(
            tasks: tasks,
          ),
        ],
      ),
    );
      } else {
        return const SizedBox.shrink();
      }
    },
     );
  }
}
