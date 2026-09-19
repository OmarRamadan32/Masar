import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class TaskOverviewCard extends StatelessWidget {
  const new({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isPrimary,
    this.flex,
  });
  final String title, subtitle;
  final IconData icon;
  final bool isPrimary;
  final int? flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isPrimary ? AppColors.primaryContainer : AppColors.cardsColor,
          borderRadius: AppSizes.r16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 20, color: AppColors.primaryColor),
            AppSizes.h10,
            Text(subtitle, style: AppStyles.primaryRegular14),
            AppSizes.h10,
            Text(
              title,
              style: AppStyles.primaryBold20.copyWith(
                color: isPrimary ? AppColors.primaryColor : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
