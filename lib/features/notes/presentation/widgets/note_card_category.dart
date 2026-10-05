import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/features/categories/data/models/category_model.dart';

class NoteCardCategory extends StatelessWidget {
  const new({super.key, this.category});
  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
      decoration: BoxDecoration(
        color: Color(category?.color ?? 0xFFFAFAFA),
        borderRadius: AppSizes.r8,
      ),
      child: Text(
        category?.name ?? "بدون فئة",
        style: AppStyles.primaryRegular11.copyWith(
          color: category?.color == null
              ? AppColors.textSecondary75Color
              : null,
        ),
      ),
    );
  }
}
