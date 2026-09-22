import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_card.dart';

class TasksOverviewSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TaskOverviewCard(
          title: "2 مهمة",
          subtitle: "الأولوية القصوي",
          icon: IconsaxPlusBold.star_1,
          isPrimary: false,
        ),
        AppSizes.w10,
        TaskOverviewCard(
          title: "12 مهمة",
          subtitle: "المهام المكتملة",
          icon: IconsaxPlusBold.tick_circle,
          isPrimary: true,
        ),
      ],
    );
  }
}
