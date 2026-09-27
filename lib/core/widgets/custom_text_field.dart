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
    this.controller,
    this.isTitle,
  });
  final String? initialValue;
  final int? maxLines;
  final String? hintText;
  final CustomTextFieldType type;
  final TextEditingController? controller;
  final bool? isTitle;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  void initState() {
    widget.controller?.text = widget.initialValue ?? '';
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final isInfinity = widget.type == CustomTextFieldType.infinityTextField;
    final isMultiLine = widget.type == CustomTextFieldType.multiLineTextField;
    // set maxLines
    final int? effectiveMaxLines = isInfinity
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
        controller: widget.controller,
        maxLines: effectiveMaxLines,
        expands: expands,
        cursorColor: AppColors.primaryColor,
        keyboardType: keyboardType,
        style: widget.isTitle == true
            ? AppStyles.primaryBold16
            : AppStyles.primaryRegular16,
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
