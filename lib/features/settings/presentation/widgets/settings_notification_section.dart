import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/features/settings/presentation/widgets/setting_item.dart';
import 'package:masar/features/settings/presentation/widgets/setting_section.dart';

class SettingsNotificationSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingSection(
      sectionTitle: "الاشعارات",
      items: [
        SettingItem(
          itemIcon: IconsaxPlusBold.notification,
          itemIconColor: const Color(0XFF596342),
          itemIconBackgroundColor: const Color(0XFFEEF9CD),
          itemTitle: "الاشعارات",
          itemSubtitle: "تفاصيل الاشعارات",
          leadingWidget: Transform.scale(
            scale: 0.8,
            child: Switch(
              value: true,
              onChanged: (value) {},
              activeThumbColor: AppColors.surfaceSecondaryColor,
              activeTrackColor: AppColors.primaryColor,
              inactiveThumbColor: AppColors.surfaceSecondaryColor,
              inactiveTrackColor: AppColors.surfaceSecondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
