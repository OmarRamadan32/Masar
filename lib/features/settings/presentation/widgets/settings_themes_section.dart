import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/features/settings/presentation/widgets/setting_item.dart';
import 'package:masar/features/settings/presentation/widgets/setting_items_divider.dart';
import 'package:masar/features/settings/presentation/widgets/setting_section.dart';

class SettingsThemesSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSection(
      sectionTitle: "المظهر",
      items: [
        SettingItem(
          itemIcon: IconsaxPlusBold.colorfilter,
          itemIconColor: AppColors.primaryColor,
          itemIconBackgroundColor: AppColors.primaryContainer,
          itemTitle: "الوضع الداكن",
          itemSubtitle: "تلقائي حسب اعدادات النظام",
          leadingWidget: Transform.scale(
            scale: 0.8,
            child: const Text("تلقائي"),
          ),
        ),
        const SettingItemsDivider(),
        SettingItem(
          itemIcon: IconsaxPlusBold.language_circle,
          itemIconColor: AppColors.primaryColor,
          itemIconBackgroundColor: AppColors.primaryContainer,
          itemTitle: "اللغة",
          itemSubtitle: "اللغة العربية (الافترضي)",
          leadingWidget: Transform.scale(
            scale: 0.8,
            child: const Text("تلقائي"),
          ),
        ),
      ],
    );
  }
}
