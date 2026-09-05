import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class TodayTasksProgressCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: AppSizes.r16,
        gradient: buildGradient(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "اليوم",
            style: AppStyles.primaryBold13.copyWith(
              color: const Color(0xFFE1FFEC),
              fontSize: 12,
            ),
          ),
          AppSizes.h20,
          Row(
            children: [
              Expanded(
                child: Text(
                  "لديك 4 مهام غير مكتملة",
                  style: AppStyles.primaryBold20.copyWith(
                    fontSize: 24,
                    color: const Color(0xFFE1FFEC),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
          AppSizes.h20,
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  IconsaxPlusBold.flash_1,
                  size: 20,
                  color: Color(0xFFE1FFEC),
                ),
                AppSizes.w4,
                Text(
                  "تم انجاز 70% من مهامك",
                  style: AppStyles.primaryRegular14.copyWith(
                    color: const Color(0xFFE1FFEC),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Gradient buildGradient() {
    return const RadialGradient(
      center: Alignment(-0.9, 0.9),
      radius: 1.2,
      colors: [Color.fromARGB(255, 71, 143, 108), AppColors.primaryColor],
      stops: [0.0, 1.0],
    );
  }
}
