import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/cubit/selection_cubit.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class ScreenTitleNormalMode extends StatelessWidget {
  const new({
    super.key,
    required this.title,
    this.addItemScreenPath,
    required this.hasOptions,
  });
  final String title;
  final String? addItemScreenPath;
  final bool hasOptions;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Text(title, style: AppStyles.secondaryBold26)),
        hasOptions == true
            ? Row(
                children: [
                  GestureDetector(
                    onTap: () => context.push(addItemScreenPath!),
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: AppSizes.r8,
                        color: AppColors.cardsColor,
                      ),
                      child: const Icon(
                        IconsaxPlusLinear.add_square,
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
                        IconsaxPlusLinear.mouse_square,
                        color: AppColors.textPrimaryColor,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
