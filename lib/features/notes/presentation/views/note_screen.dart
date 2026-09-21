import 'package:flutter/material.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';

class NoteScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      // this icon will only be shown when the user Edit the note
      action: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.check, color: AppColors.primaryColor),
      ),
      canPop: true,
      child: const Column(
        children: [
          CustomTextField(
            type: CustomTextFieldType.normalTextField,
            initialValue: "عنوان الملاحظة",
          ),
          AppSizes.h10,
          CustomTextField(
            initialValue: "الملاحظة",
            type: CustomTextFieldType.multiLineTextField,
            
          ),
        ],
      ),
    );
  }
}
