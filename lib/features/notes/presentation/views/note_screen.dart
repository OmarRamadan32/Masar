import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_text_field.dart';

class NoteScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomTextField(isMultiLine: false, initialValue: "عنوان الملاحظة"),
        AppSizes.h10,
        CustomTextField(initialValue: "الملاحظة", isMultiLine: true),
      ],
    );
  }
}
