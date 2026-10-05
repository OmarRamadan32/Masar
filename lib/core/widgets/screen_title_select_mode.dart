import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/cubit/selection_cubit.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class ScreenTitleSelectMode extends StatelessWidget {
  const new({super.key, required this.onDelete});
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    "عدد العناصر المختارة:  ",
                    style: AppStyles.primaryBold16,
                  ),

                  Text(
                    "${context.read<SelectionCubit>().state.selectedItems.length}",
                    style: AppStyles.primaryBold20.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    onDelete!();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: AppSizes.r8,
                      color: AppColors.cardsColor,
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.trash,
                      color: AppColors.textPrimaryColor,
                      size: 22,
                    ),
                  ),
                ),
                AppSizes.w20,
                GestureDetector(
                  onTap: () {
                    context.read<SelectionCubit>().toggleSelectionMode();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: AppSizes.r8,
                      color: AppColors.cardsColor,
                    ),
                    child: const Icon(
                      IconsaxPlusLinear.close_square,
                      color: AppColors.textPrimaryColor,
                      size: 22,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          width: double.infinity,
          child: Divider(thickness: 1, color: Color.fromARGB(117, 88, 96, 100)),
        ),
      ],
    );
  }
}
