
import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CategoriesTabItem extends StatelessWidget {
  const new({super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: AppSizes.r12,
        color: isSelected ? AppColors.primaryColor : AppColors.cardsColor,
      ),
      child: Text(
        title,
        style: AppStyles.primaryBold13.copyWith(
          color: isSelected ? AppColors.surfacePrimaryColor : null,
        ),
      ),
    );
  }
}
