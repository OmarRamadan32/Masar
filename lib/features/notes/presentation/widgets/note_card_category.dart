import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class NoteCardCategory extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: AppSizes.r8,
      ),
      child: const Text("شخصي", style: AppStyles.primaryRegular11),
    );
  }
}
