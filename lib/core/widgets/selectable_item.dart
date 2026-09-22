import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/tasks/presentation/widgets/tesk_item_checkbox.dart';

class SelectableItem extends StatelessWidget {
  const new({super.key, required this.item, required this.isSelected});
  final Widget item;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        color: isSelected
            ? AppColors.primaryContainer
            : AppColors.surfacePrimaryColor,
        borderRadius: AppSizes.r16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TaskItemCheckbox(isCompleted: isSelected),
          AppSizes.h10,
          IgnorePointer(ignoring: true, child: item),
        ],
      ),
    );
  }
}
