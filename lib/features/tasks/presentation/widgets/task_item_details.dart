import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/constants/app_options.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class TaskItemDetails extends StatelessWidget {
  const new({
    super.key,
    required this.priority,
    this.categoryName,
    required this.isCompleted,
  });
  final String priority;
  final String? categoryName;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    Color priorityColor = priority == AppOptions.normal
        ? Colors.green
        : priority == AppOptions.high
        ? const Color(0XFF9F403D)
        : Colors.blue;
    return Row(
      children: [
        Text(
          priority,
          style: AppStyles.primaryBold14.copyWith(
            color: priorityColor,
            fontSize: 11,
          ),
        ),
        AppSizes.w10,
        Row(
          children: [
            const Icon(IconsaxPlusLinear.folder_2, size: 11),
            AppSizes.w4,
            Text(
              categoryName ?? "بدون فئة",
              style: AppStyles.primaryBold14.copyWith(
                color: AppColors.textPrimaryColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
        AppSizes.w10,
        if (isCompleted)
          Row(
            children: [
              const Icon(Icons.check, size: 11, color: Colors.green),
              AppSizes.w4,
              Text(
                "مكتملة بالكامل",
                style: AppStyles.primaryBold14.copyWith(fontSize: 11),
              ),
            ],
          ),
      ],
    );
  }
}
