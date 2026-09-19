import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_card.dart';

class TaskOverviewSectionOne extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        TaskOverviewCard(
          title: "5 مرات",
          subtitle: "عدد المرات المتبقية",
          icon: IconsaxPlusBold.timer_1,
          isPrimary: false,
        ),
        AppSizes.w10,
        TaskOverviewCard(
          title: "10 مرات",
          subtitle: "عدد مرات الانجاز",
          icon: IconsaxPlusBold.flash_1,
          isPrimary: true,
        ),
      ],
    );
  }
}
