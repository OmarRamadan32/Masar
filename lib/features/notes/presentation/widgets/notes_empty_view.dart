import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class NotesEmptyView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Opacity(
          opacity: 0.5,
          child: SizedBox(
            height: 300,
            width: 300,
            child: SvgPicture.asset("assets/icons/empty.svg", fit: BoxFit.fill),
          ),
        ),
        AppSizes.h16,
        Text("لا توجد أي ملاحظات", style: AppStyles.primaryRegular16),
        AppSizes.h4,
        TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: AppSizes.r16),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            overlayColor: AppColors.primaryColor,
            elevation: 0,
          ),
          onPressed: () {
            context.push(AppRoutes.addNote);
          },
          child: Text(
            "إضافة ملاحظة",
            style: AppStyles.primaryBold14.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
