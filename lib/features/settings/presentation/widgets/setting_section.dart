import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/settings/presentation/widgets/setting_section_title.dart';

class SettingSection extends StatelessWidget {
  const new({super.key, required this.sectionTitle, required this.items});
  final String sectionTitle;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SettingSectionTitle(title: sectionTitle),
        AppSizes.h8,
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surfaceSecondaryColor,
            borderRadius: AppSizes.r16,
          ),
          child: Column(children: items),
        ),
      ],
    );
  }
}