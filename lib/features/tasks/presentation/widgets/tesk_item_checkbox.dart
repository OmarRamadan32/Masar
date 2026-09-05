import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';

class TaskItemCheckbox extends StatelessWidget {
  const new({super.key, required this.isCompleted});
  final bool isCompleted;
  @override
  Widget build(BuildContext context) {
    if (isCompleted) {
      return const Icon(
        IconsaxPlusBold.tick_circle,
        color: AppColors.primaryColor,
        size: 24,
      );
    } else {
      return Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle, // جعل المربع المفرغ دائرة
          border: Border.all(color: Colors.grey.shade400, width: 2),
        ),
      );
    }
  }
}