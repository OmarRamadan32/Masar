import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CustomButton extends StatelessWidget {
  const new({super.key, required this.title, required this.onPress});
  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: AppSizes.r16),
      ),
      child: Text(
        title,
        style: AppStyles.secondaryBold20.copyWith(
          color: AppColors.surfacePrimaryColor,
        ),
      ),
    );
  }
}
