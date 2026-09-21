import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/widgets/option_widget.dart';

class OptionsPicker extends StatefulWidget {
  const new({
    super.key,
    this.cutomOption,
    required this.title,
    required this.optionsList,
  });
  final Widget? cutomOption;
  final String title;
  final List<String> optionsList;

  @override
  State<OptionsPicker> createState() => _OptionsPickerState();
}

class _OptionsPickerState extends State<OptionsPicker> {
  int selectedIndex = 100;
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
          Text(widget.title, style: AppStyles.secondaryMedium18),
          AppSizes.h10,
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.optionsList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: OptionWidget(
                          title: widget.optionsList[index],
                          isActive: index == selectedIndex,
                        ),
                      );
                    },
                  ),
                ),
                widget.cutomOption != null
                    ? Row(
                        children: [
                          const SizedBox(
                            width: 1,
                            child: Divider(
                              thickness: 30,
                              color: Color.fromARGB(101, 88, 96, 100),
                              height: 30,
                            ),
                          ),
                          AppSizes.w4,
                          widget.cutomOption!,
                        ],
                      )
                    : const SizedBox(),
                // widget.cutomOption ?? const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
