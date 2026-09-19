import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item_details.dart';
import 'package:masar/features/tasks/presentation/widgets/task_item_title.dart';
import 'package:masar/features/tasks/presentation/widgets/tesk_item_checkbox.dart';

// This widget will be converted to a stateless widget, and leave the state management to the parent widget
// using the Cubit
class TaskItem extends StatefulWidget {
  const new({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isCompleted = !isCompleted;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardsColor,
          borderRadius: AppSizes.r16,
        ),
        child: Row(
          children: [
            TaskItemCheckbox(isCompleted: isCompleted),
            AppSizes.w10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TaskItemTitle(isCompleted: isCompleted),
                AppSizes.h4,
                const TaskItemDetails(),
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                context.push(AppRoutes.task);
              },
              child: const Icon(IconsaxPlusLinear.arrow_left_1, size: 20),
            ),
          ],
        ),
      ),
    );
  }
}
