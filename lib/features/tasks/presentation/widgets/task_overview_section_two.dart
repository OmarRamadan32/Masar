import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_card.dart';

class TaskOverviewSectionTwo extends StatelessWidget {
  const new({super.key, required this.nextDate, required this.isDone});
  final String nextDate;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        TaskOverviewCard(
          title: nextDate,
          subtitle: "الموعد القادم",
          icon: IconsaxPlusBold.notification,
          isPrimary: false,
        ),
        AppSizes.w10,
        TaskOverviewCard(
          flex: 2,
          title: isDone ? "مكتملة" : "غير مكتملة",
          subtitle: "حالة المهمة",
          icon: IconsaxPlusBold.tick_circle,
          isPrimary: isDone,
        ),
      ],
    );
  }
}
