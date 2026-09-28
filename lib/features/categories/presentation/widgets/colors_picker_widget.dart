import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/features/categories/presentation/widgets/color_widget.dart';

class ColorsPickerWidget extends StatefulWidget {
  const new({super.key, this.onColorSelected});
  static const List<int> colors = AppColors.categoriesColors;
  final Function(int)? onColorSelected;

  @override
  State<ColorsPickerWidget> createState() => _ColorsPickerWidgetState();
}

class _ColorsPickerWidgetState extends State<ColorsPickerWidget> {

  int? selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondaryColor,
        borderRadius: AppSizes.r12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ignore: prefer_const_constructors
              Icon(
                IconsaxPlusLinear.colorfilter,
                color: AppColors.textPrimaryColor,
                size: 20,
              ),
              AppSizes.w8,
              Text("اللون", style: AppStyles.secondaryMedium18),
            ],
          ),
          AppSizes.h10,
          SizedBox(
            // height: 100,
            child: Wrap(
              children: [
                ...List.generate(ColorsPickerWidget.colors.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        widget.onColorSelected!(
                          ColorsPickerWidget.colors[index],
                        );
                      });
                    },
                    child: ColorWidget(
                      isSelected: index == selectedIndex,
                      color: Color(ColorsPickerWidget.colors[index]),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
