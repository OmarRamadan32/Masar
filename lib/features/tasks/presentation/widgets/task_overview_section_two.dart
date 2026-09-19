import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_card.dart';

class TaskOverviewSectionTwo extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children:  [
        TaskOverviewCard(
          title: "غدا",
          subtitle: "الموعد القادم",
          icon: IconsaxPlusBold.notification,
          isPrimary: false,
        ),
        AppSizes.w10,
        TaskOverviewCard(
          flex: 2,
          title: "تم الانجاز",
          subtitle: "حالة المهمة",
          icon: IconsaxPlusBold.tick_circle,
          isPrimary: true,
        ),
      ],
    );
  }
}
