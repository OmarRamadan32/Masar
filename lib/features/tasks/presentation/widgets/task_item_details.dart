import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class TaskItemDetails extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "عالية!",
          style: AppStyles.primaryBold14.copyWith(
            color: const Color(0XFF9F403D),
            fontSize: 11,
          ),
        ),
        AppSizes.w10,
        Row(
          children: [
            const Icon(IconsaxPlusLinear.folder_2, size: 11),
            AppSizes.w4,
            Text(
              "العمل",
              style: AppStyles.primaryBold14.copyWith(
                color: AppColors.textPrimaryColor,
                fontSize: 11,
              ),
            ),
          ],
        ),
        AppSizes.w10,
      ],
    );
  }
}
