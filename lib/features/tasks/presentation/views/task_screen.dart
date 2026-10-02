import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/utils/date_formatter.dart';
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
    if (task.remainingCount > 0) {
      task.isCompleted = !task.isCompleted;
      // Last check date
      task.lastCheckDate = DateFormatter.formatDateOnly(DateTime.now());
      // Completed count
      task.completedCount = task.isCompleted
          ? task.completedCount + 1
          : task.completedCount - 1;
      // is Task Completed
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
                  nextDate: task.repeatType,
                ),
                AppSizes.h20,
                Text("تفاصيل المهمة", style: AppStyles.primaryRegular16),
                const Spacer(),
                task.remainingCount > 0
                    ? CustomButton(
                        buttonTitle: task.isCompleted == false
                            ? "انجاز المهمة"
                            : "الغاء الانجاز",
                        onPress: () {
                          _onPress(context);
                        },
                      )
                    : const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check, color: Colors.green),
                            AppSizes.w4,
                            Text("تم انجاز جميع مرات تكرار المهمة"),
                          ],
                        ),
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
