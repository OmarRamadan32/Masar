import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_section_one.dart';
import 'package:masar/features/tasks/presentation/widgets/task_overview_section_two.dart';

class TaskScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      canPop: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("عنوان المهمة", style: AppStyles.primaryBold20),
          AppSizes.h16,
          const TaskOverviewSectionOne(),
          AppSizes.h10,
          const TaskOverviewSectionTwo(),
          AppSizes.h20,
          Text("تفاصيل المهمة", style: AppStyles.primaryRegular16),
        ],
      ),
    );
  }
}
