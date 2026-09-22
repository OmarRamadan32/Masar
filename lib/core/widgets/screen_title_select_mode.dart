import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class ScreenTitleSelectMode extends StatelessWidget {
  const new({super.key, required this.onDelete});
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "تم اختيار:",
          style: AppStyles.primaryBold20.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        AppSizes.w10,
        Text("3", style: AppStyles.primaryBold20),
        const Spacer(),
        Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: AppSizes.r8,
                  color: AppColors.cardsColor,
                ),
                child: const Icon(
                  IconsaxPlusBold.trash,
                  color: AppColors.textPrimaryColor,
                  size: 22,
                ),
              ),
            ),
            AppSizes.w20,
            GestureDetector(
              onTap: () {
                // this will Trigger the Normal (Note/Task) Mode
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  borderRadius: AppSizes.r8,
                  color: AppColors.cardsColor,
                ),
                child: const Icon(
                  IconsaxPlusBold.close_square,
                  color: AppColors.textPrimaryColor,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

