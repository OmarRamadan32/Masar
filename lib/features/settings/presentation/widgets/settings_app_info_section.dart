import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/features/settings/presentation/widgets/setting_item.dart';
import 'package:masar/features/settings/presentation/widgets/setting_items_divider.dart';
import 'package:masar/features/settings/presentation/widgets/setting_section.dart';

class SettingsAppInfoSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSection(
      sectionTitle: "حول التطبيق",
      items: [
        SettingItem(
          itemIcon: IconsaxPlusBold.info_circle,
          itemIconColor: AppColors.textSecondaryColor,
          itemIconBackgroundColor: const Color(0XFFE3E9EC),
          itemTitle: "الاصدار",
          itemSubtitle: "Version 1.0.0",
          leadingWidget: Transform.scale(scale: 0.8),
        ),
        const SettingItemsDivider(),
        SettingItem(
          itemIcon: IconsaxPlusBold.shield_search,
          itemIconColor: AppColors.textSecondaryColor,
          itemIconBackgroundColor: const Color(0XFFE3E9EC),
          itemTitle: "سياسة الخصوصية",
          itemSubtitle: "كيف تتعامل مع بياناتك",
          leadingWidget: Transform.scale(
            scale: 0.8,
            child: const Icon(IconsaxPlusLinear.arrow_left_1, size: 20),
          ),
        ),
      ],
    );
  }
}
