import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_card.dart';

class TasksOverviewSection extends StatelessWidget {
  const new({super.key,required this.tasksWithHighPriority,required this.completedTasks});
  final int tasksWithHighPriority;
  final int completedTasks;

  @override

  Widget build(BuildContext context) {
    return Row(
      children: [
        TaskOverviewCard(
          title: '$tasksWithHighPriority مهمة',
          subtitle: "الأولوية القصوي",
          icon: IconsaxPlusBold.star_1,
          isPrimary: false,
        ),
        AppSizes.w10,
         TaskOverviewCard(
          title: '$completedTasks مهمة',
          subtitle: "المهام المكتملة",
          icon: IconsaxPlusBold.tick_circle,
          isPrimary: true,
        ),
      ],
    );
  }
}
