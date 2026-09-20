import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/widgets/option_widget.dart';

class OptionsPicker extends StatefulWidget {
  const new({super.key, this.cutomOption});
  final Widget? cutomOption;

  @override
  State<OptionsPicker> createState() => _OptionsPickerState();
}

class _OptionsPickerState extends State<OptionsPicker> {
  int selectedIndex = 0;
  List<String> options = [
    "مواعيد",
    "سفر",
    "الدراسة",
    "العمل",
    "الاصدقاء",
    "ِشخصي",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondaryColor,
        borderRadius: AppSizes.r12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("القسم", style: AppStyles.secondaryMedium18),
          AppSizes.h10,
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: OptionWidget(
                          title: options[index],
                          isActive: index == selectedIndex,
                        ),
                      );
                    },
                  ),
                ),
                widget.cutomOption ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
