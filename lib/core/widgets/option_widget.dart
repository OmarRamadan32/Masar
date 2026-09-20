import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class OptionWidget extends StatelessWidget {
  const new({super.key, required this.title, required this.isActive});
  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryContainer : AppColors.cardsColor,
        borderRadius: AppSizes.r8,
      ),
      child: Text(
        title,
        style: isActive
            ? AppStyles.primaryBold13
            : AppStyles.primaryRegular14,
      ),
    );
  }
}
