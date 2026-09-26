import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/theme/app_styles.dart';
import 'package:masar/core/widgets/option_widget.dart';

class OptionsPicker extends StatefulWidget {
  const OptionsPicker({
    super.key,
    required this.title,
    required this.optionsList,
    this.titleIcon,
    this.customOption,
    this.initialOption,
    this.onSelect,
  });

  final String title;
  final List<String> optionsList;
  final IconData? titleIcon;
  final Widget? customOption;
  final String? initialOption;
  final ValueChanged<String?>? onSelect;

  @override
  State<OptionsPicker> createState() => _OptionsPickerState();
}

class _OptionsPickerState extends State<OptionsPicker> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    if (widget.initialOption != null) {
      final index = widget.optionsList.indexOf(widget.initialOption!);
      if (index != -1) {
        selectedIndex = index;
      }
    }
  }

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
          // Header Row (Icon + Title)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.titleIcon != null) ...[
                Icon(
                  widget.titleIcon,
                  color: AppColors.textPrimaryColor,
                  size: 20,
                ),
                AppSizes.w8,
              ],
              Text(widget.title, style: AppStyles.secondaryMedium18),
            ],
          ),
          AppSizes.h10,

          // Options Horizontal List
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.optionsList.length,
                    itemBuilder: (context, index) {
                      final option = widget.optionsList[index];
                      final isSelected = index == selectedIndex;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (selectedIndex == index) {
                              selectedIndex = null;
                              widget.onSelect?.call(null);
                            } else {
                              selectedIndex = index;
                              widget.onSelect?.call(option);
                            }
                          });
                        },
                        child: OptionWidget(
                          title: option,
                          isActive: isSelected,
                        ),
                      );
                    },
                  ),
                ),

                // Custom Option & Vertical Divider
                if (widget.customOption != null) ...[
                  AppSizes.w4,
                  const VerticalDivider(
                    width: 1,
                    thickness: 1,
                    indent: 4,
                    endIndent: 4,
                    color: Color.fromARGB(101, 88, 96, 100),
                  ),
                  AppSizes.w8,
                  widget.customOption!,
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
