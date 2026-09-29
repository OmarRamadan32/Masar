import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/widgets/custom_button.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_section_one.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_section_two.dart';

class TaskScreen extends StatelessWidget {
  const new({super.key, required this.task});
  final TaskModel task;

  Future<void> _onPress(BuildContext context) async {
    if (task.canCheck) {
      task.isCompleted = !task.isCompleted;
      task.completedCount = task.isCompleted
          ? task.completedCount + 1
          : task.completedCount - 1;
    } else if (task.isCompleted) {
      task.isCompleted = false;
      task.completedCount = task.completedCount - 1;
    }
    context.read<TasksCubit>().updateTask(task: task);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        if (state is TasksLoaded) {
          return CustomScreen(
            canPop: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title, style: AppStyles.primaryBold20),
                AppSizes.h16,
                TaskOverviewSectionOne(
                  timesCompleted: task.completedCount,
                  timesUntilCompletion: task.remainingCount,
                ),
                AppSizes.h10,
                TaskOverviewSectionTwo(
                  isDone: task.isCompleted,
                  nextDate: task.time,
                ),
                AppSizes.h20,
                Text("تفاصيل المهمة", style: AppStyles.primaryRegular16),
                const Spacer(),
                CustomButton(
                  buttonTitle: task.canCheck ? "انجاز المهمة" : "الغاء الانجاز",
                  onPress: () {
                    _onPress(context);
                  },
                ),

                AppSizes.h20,
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
