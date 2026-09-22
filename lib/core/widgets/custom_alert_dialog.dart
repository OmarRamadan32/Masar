import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final Color? confirmColor;
  final VoidCallback onConfirm;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.confirmColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: AppSizes.r16),

      backgroundColor: AppColors.surfaceSecondaryColor,
      title: Row(children: [Text(title)]),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "إلغاء",
            style: AppStyles.primaryBold14.copyWith(
              color: confirmColor ?? AppColors.primaryColor,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          child: Text("تأكيد", style: AppStyles.primaryRegular13),
        ),
      ],
    );
  }
}
