import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/cubit/selection_cubit.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:masar/features/tasks/presentation/widgets/selectable_tasks_view.dart';

import 'package:masar/features/tasks/presentation/widgets/tasks_view_section.dart';

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

  Future<void> _onDelete(
    BuildContext context,
    List<TaskModel> selectedItems,
  ) async {
    TasksCubit tasksCubit = context.read<TasksCubit>();
    SelectionCubit selectionCubit = context.read<SelectionCubit>();
    if (selectedItems.isNotEmpty) {
      await tasksCubit.deleteTasks(tasks: selectedItems);
      selectionCubit.clearSelection();
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('تم حذف المهام بنجاح')));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك حدد المهام المراد حذفها')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SelectionCubit(),
      child: BlocBuilder<TasksCubit, TasksState>(
        builder: (context, state) {
          if (state is TasksLoaded) {
            List<TaskModel> incompletedTasks = state.tasks
                .where((element) => !element.isCompletedForToday)
                .toList();
            List<TaskModel> completedTasks = state.tasks
                .where((element) => element.isCompletedForToday)
                .toList();
            List<TaskModel> allTasks = [...incompletedTasks, ...completedTasks];
            return CustomScreen(
              canPop: false,
              child: BlocBuilder<SelectionCubit, SelectionState>(
                builder: (context, selectionState) {
                  if (selectionState.isSelectionMode) {
                    return Column(
                      children: [
                        ScreenTitle(
                          isSelectMode: true,
                          onDelete: () {
                            _onDelete(
                              context,
                              selectionState.selectedItems.cast<TaskModel>(),
                            );
                          },
                          title: "المهام",
                          hasOptions: true,
                        ),
                        AppSizes.h10,
                        Expanded(child: SelectableTasksView(tasks: allTasks)),
                      ],
                    );
                  } else {
                    return TasksViewSection(
                      incompletedTasks: incompletedTasks,
                      completedTasks: completedTasks,
                    );
                  }
                },
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
