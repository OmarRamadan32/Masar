import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_card.dart';

class TaskOverviewSectionOne extends StatelessWidget {
  const new({super.key,
    required this.timesUntilCompletion,
    required this.timesCompleted,});
  final int timesUntilCompletion;
  final int timesCompleted;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        TaskOverviewCard(
          title: "${timesUntilCompletion.toString()} مرات",
          subtitle: "عدد المرات المتبقية",
          icon: IconsaxPlusBold.timer_1,
          isPrimary: false,
        ),
        AppSizes.w10,
        TaskOverviewCard(
          title: "${timesCompleted.toString()} مرات",
          subtitle: "عدد مرات الانجاز",
          icon: IconsaxPlusBold.flash_1,
          isPrimary: true,
        ),
      ],
    );
  }
}
