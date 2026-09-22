import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/constants/app_options.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_button.dart';
import 'package:masar/core/widgets/custom_option_widget.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/core/widgets/opstions_picker.dart';
import 'package:masar/core/widgets/screen_title.dart';

class AddTaskScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      canPop: true,
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: ScreenTitle(title: "اضافة مهمة", hasOptions: false),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),
          const SliverToBoxAdapter(
            child: CustomTextField(
              type: CustomTextFieldType.normalTextField,
              hintText: "عنوان المهمة",
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),
          const SliverToBoxAdapter(
            child: OptionsPicker(
              title: "القسم",
              titleIcon: IconsaxPlusLinear.category_2,
              optionsList: AppOptions.categoriesOptions,
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),
          const SliverToBoxAdapter(
            child: OptionsPicker(
              titleIcon: IconsaxPlusLinear.status_up,
              title: "درجة الأولوية",
              optionsList: AppOptions.priorityOptions,
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),
          const SliverToBoxAdapter(
            child: OptionsPicker(
              titleIcon: IconsaxPlusLinear.repeat,
              title: "عدد مرات التكرار",
              optionsList: AppOptions.taskCount,
              cutomOption: CustomOptionWidget(
                title: "مخصص",
                icon: IconsaxPlusBold.repeat_circle,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),
          const SliverToBoxAdapter(
            child: OptionsPicker(
              title: "التكرار",
              titleIcon: IconsaxPlusLinear.calendar,
              optionsList: AppOptions.taskRepeat,
              cutomOption: CustomOptionWidget(
                title: "مخصص",
                icon: IconsaxPlusBold.calendar,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: AppSizes.h10),

          SliverFillRemaining(
            hasScrollBody: false,
            fillOverscroll: false,
            child: Column(
              children: [
                const Expanded(
                  child: CustomTextField(
                    type: CustomTextFieldType.infinityTextField,
                    hintText: "ملاحظات",
                  ),
                ),
                AppSizes.h10,
                CustomButton(title: "إتمام", onPress: () {}),
                AppSizes.h10,
              ],
            ),
          ),

          const SliverToBoxAdapter(child: AppSizes.h10),
        ],
      ),
    );
  }
}
