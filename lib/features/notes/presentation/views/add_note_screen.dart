import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/core/widgets/opstions_picker.dart';
import 'package:masar/features/main_layout/widgets/screen_title.dart';

class AddNoteScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      action: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.check, color: AppColors.primaryColor),
      ),
      canPop: true,
      child: const Column(
        children: [
          ScreenTitle(title: "اضافة ملاحظة", hasOptions: false),
          AppSizes.h10,
          CustomTextField(isMultiLine: false, initialValue: "عنوان الملاحظة"),
          AppSizes.h10,
          OptionsPicker(),
          AppSizes.h10,
          CustomTextField(initialValue: "الملاحظة", isMultiLine: true),
        ],
      ),
    );
  }
}
