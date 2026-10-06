import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CategoriesEmptyView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
          Text("لا توجد أي فئات", style: AppStyles.primaryRegular16),
          AppSizes.h4,
          TextButton(
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: AppSizes.r16),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              overlayColor: AppColors.primaryColor,
              elevation: 0,
            ),
            onPressed: () {
              context.push(AppRoutes.addCategory);
            },
            child: Text(
              "إضافة قئة",
              style: AppStyles.primaryBold14.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
