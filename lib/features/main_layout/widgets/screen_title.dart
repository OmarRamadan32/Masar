import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class ScreenTitle extends StatelessWidget {
  const new({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: Text(title, style: AppStyles.secondaryBold26)),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: AppSizes.r8,
            color: AppColors.cardsColor,
          ),
          child: const Icon(
            IconsaxPlusBold.additem,
            color: AppColors.textPrimaryColor,
            size: 22,
          ),
        ),
        AppSizes.w20,
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: AppSizes.r8,
            color: AppColors.cardsColor,
          ),
          child: const Icon(
            IconsaxPlusBold.mouse_square,
            color: AppColors.textPrimaryColor,
            size: 22,
          ),
        ),
      ],
    );
  }
}
