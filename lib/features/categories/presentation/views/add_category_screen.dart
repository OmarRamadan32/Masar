import 'package:flutter/material.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_button.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/features/categories/presentation/widgets/colors_picker_widget.dart';
import 'package:masar/core/widgets/screen_title.dart';

class AddCategoryScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      canPop: true,
      child: Column(
        children: [
          AppSizes.h10,
          const ScreenTitle(title: "اضافة قسم", hasOptions: false),
          AppSizes.h10,
          const CustomTextField(
            type: CustomTextFieldType.normalTextField,
            hintText: "اسم القسم",
          ),
          AppSizes.h10,
          const CustomTextField(
            type: CustomTextFieldType.multiLineTextField,
            hintText: "ملاحظة",
            maxLines: 3,
          ),
          AppSizes.h10,
          const ColorsPickerWidget(),
          const Spacer(),
          CustomButton(title: "إتمام", onPress: () {}),
        ],
      ),
    );
  }
}
