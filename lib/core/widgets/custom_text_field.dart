import 'package:flutter/material.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';

class CustomTextField extends StatefulWidget {
  const new({
    super.key,
    this.initialValue,
    this.maxLines,
    this.hintText,
    required this.type,
  });
  final String? initialValue;
  final int? maxLines;
  final String? hintText;
  final CustomTextFieldType type;

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
    final isInfinity = widget.type == CustomTextFieldType.infinityTextField;
    final isMultiLine = widget.type == CustomTextFieldType.multiLineTextField;
    // set maxLines
    final int? maxLines = isInfinity
        ? null
        : (isMultiLine ? (widget.maxLines ?? 5) : widget.maxLines);
    // handle expands
    final bool expands = isInfinity;
    // set keyboardType
    final TextInputType keyboardType = (isInfinity || isMultiLine)
        ? TextInputType.multiline
        : TextInputType.text;

    Widget textFieldContent = Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondaryColor,
        borderRadius: AppSizes.r12,
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        expands: expands,
        cursorColor: AppColors.primaryColor,
        keyboardType: keyboardType,
        style: AppStyles.primaryRegular16,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppStyles.primaryRegular16,
          border: InputBorder.none,
        ),
      ),
    );

    return textFieldContent;
  }
}
