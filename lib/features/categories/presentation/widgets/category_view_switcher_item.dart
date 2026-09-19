import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CategoryViewSwitcherItem extends StatelessWidget {
  const new({super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.surfacePrimaryColor
            : AppColors.cardsColor,
        borderRadius: AppSizes.r16,
      ),
      child: Text(
        title,
        style: AppStyles.primaryRegular13.copyWith(
          fontWeight: isSelected ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
