import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/constants/app_constants.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_button.dart';
import 'package:masar/core/widgets/custom_option_widget.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/core/widgets/opstions_picker.dart';
import 'package:masar/features/main_layout/widgets/screen_title.dart';

class AddTaskScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      canPop: true,
      child: Column(
        children: [
          const ScreenTitle(title: "اضافة مهمة", hasOptions: false),
          AppSizes.h10,
          const CustomTextField(isMultiLine: false, hintText: "عنوان المهمة"),
          AppSizes.h10,
          const OptionsPicker(
            title: "القسم",
            optionsList: AppOptions.categoriesOptions,
          ),
          AppSizes.h10,
          const OptionsPicker(
            title: "درجة الأولوية",
            optionsList: AppOptions.priorityOptions,
          ),
          AppSizes.h10,
          const OptionsPicker(
            title: "عدد مرات التكرار",
            optionsList: AppOptions.taskCount,
            cutomOption: CustomOptionWidget(
              title: "مخصص",
              icon: IconsaxPlusBold.repeat_circle,
            ),
          ),
          AppSizes.h10,
          const OptionsPicker(
            title: "التكرار",
            optionsList: AppOptions.taskRepeat,
            cutomOption: CustomOptionWidget(
              title: "مخصص",
              icon: IconsaxPlusBold.calendar,
            ),
          ),
          AppSizes.h10,
          const CustomTextField(isMultiLine: true, hintText: "ملاحظات"),
          AppSizes.h10,
          CustomButton(title: "إتمام", onPress: () {}),
          AppSizes.h10,
        ],
      ),
    );
  }
}
