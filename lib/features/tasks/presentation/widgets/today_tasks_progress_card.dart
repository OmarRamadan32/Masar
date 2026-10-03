import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';

class TodayTasksProgressCard extends StatelessWidget {
  const new({
    super.key,
    required this.inCompleteTasks,
    required this.completedTasks,
  });
  final int inCompleteTasks;
  final int completedTasks;

  @override
  Widget build(BuildContext context) {
    List<TaskModel> tasks = context.read<TasksCubit>().tasksList;

    int completedTasks = tasks
        .where((element) => element.isCompletedForToday)
        .length;
    int inCompleteTasks = tasks.length - completedTasks;

    String cardTitle = inCompleteTasks == 0
        ? "جميع المهام مكتملة"
        : "لديك $inCompleteTasks مهام غير مكتملة";

    String completionPercentage = tasks.isEmpty
        ? "0%"
        : "${((completedTasks / tasks.length) * 100).toStringAsFixed(0)}%";
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: AppSizes.r16,
        gradient: buildGradient(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "اليوم",
            style: AppStyles.primaryBold13.copyWith(
              color: const Color(0xFFE1FFEC),
              fontSize: 12,
            ),
          ),
          AppSizes.h20,
          Row(
            children: [
              Expanded(
                child: Text(
                  cardTitle,
                  style: AppStyles.primaryBold20.copyWith(
                    color: const Color(0xFFE1FFEC),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          AppSizes.h20,
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  IconsaxPlusBold.flash_1,
                  size: 18,
                  color: Color(0xFFE1FFEC),
                ),
                AppSizes.w4,
                Text(
                  "تم انجاز $completionPercentage من مهامك",
                  style: AppStyles.primaryRegular14.copyWith(
                    color: const Color(0xFFE1FFEC),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Gradient buildGradient() {
    return const RadialGradient(
      center: Alignment(-0.9, 0.9),
      radius: 1.2,
      colors: [Color.fromARGB(255, 71, 143, 108), AppColors.primaryColor],
      stops: [0.0, 1.0],
    );
  }
}
