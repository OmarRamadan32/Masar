import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/widgets/screen_title.dart';

class TasksEmptyView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const ScreenTitle(
            title: "المهام",
            hasOptions: true,
            addItemScreenPath: AppRoutes.addTask,
            hasSelectionMode: true,
          ),
          AppSizes.h10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 0.5,
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: SvgPicture.asset(
                      "assets/icons/empty.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                AppSizes.h16,
                Text("لا توجد أي مهام", style: AppStyles.primaryRegular16),
                AppSizes.h4,
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: AppSizes.r16),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    overlayColor: AppColors.primaryColor,
                    elevation: 0,
                  ),
                  onPressed: () {
                    context.push(AppRoutes.addTask);
                  },
                  child: Text(
                    "إضافة مهمة",
                    style: AppStyles.primaryBold14.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
