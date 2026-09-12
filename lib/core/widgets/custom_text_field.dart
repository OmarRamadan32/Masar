import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CustomTextField extends StatefulWidget {
  const new({
    super.key,
    this.initialValue,
    required this.isMultiLine,
    this.maxLines,
  });
  final String? initialValue;
  final bool isMultiLine;
  final int? maxLines;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    controller.text = widget.initialValue ?? "";
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isMultiLine) {
      return Expanded(
        child: Container(
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.surfaceSecondaryColor,
            borderRadius: AppSizes.r12,
          ),
          child: TextField(
            controller: controller,
            style: AppStyles.primaryRegular16,
            maxLines: widget.isMultiLine ? 1000000000 : 1,
            cursorColor: AppColors.primaryColor,
            keyboardType: widget.isMultiLine
                ? TextInputType.multiline
                : TextInputType.text,
          ),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.topRight,
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.surfaceSecondaryColor,
          borderRadius: AppSizes.r12,
        ),
        child: TextField(
          controller: controller,
          maxLines: widget.maxLines,
          cursorColor: AppColors.primaryColor,
          keyboardType: TextInputType.multiline,
        ),
      );
    }
  }
}
