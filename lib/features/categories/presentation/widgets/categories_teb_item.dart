import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/utils/popup_utils.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';

class CategoriesTabItem extends StatelessWidget {
  const new({super.key, required this.isSelected, required this.category});
  final bool isSelected;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (LongPressStartDetails details) {
        PopupMenuUtils.openOptions(
          context,
          details,
          editText: "تعديل",
          deleteText: "حذف",
          onEdit: () {
            //Todo : navigate to edit task screen
          },
          onDelete: () {
            context.read<CategoriesCubit>().deleteCategory(category: category);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('تم حذف الفئة بنجاح')));
          },
        );
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: AppSizes.r12,
          color: isSelected ? Color(category.color) : AppColors.cardsColor,
        ),
        child: Text(
          category.name,
          style: AppStyles.primaryBold13.copyWith(
            color: isSelected ? AppColors.surfacePrimaryColor : null,
          ),
        ),
      ),
    );
  }
}
