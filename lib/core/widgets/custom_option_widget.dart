import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CustomOptionWidget extends StatelessWidget {
  const new({super.key, required this.title, required this.icon, this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: AppColors.cardsColor,
          borderRadius: AppSizes.r8,
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textSecondary75Color, size: 20),
            AppSizes.w4,
            Text(title, style: AppStyles.primaryBold13),
          ],
        ),
      ),
    );
  }
}
