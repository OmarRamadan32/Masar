import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart' show AppSizes;
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/settings/presentation/widgets/settings_app_info_section.dart';
import 'package:masar/features/settings/presentation/widgets/settings_notification_section.dart';
import 'package:masar/features/settings/presentation/widgets/settings_themes_section.dart';

class SettingsScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      canPop: false,
      child: Column(
        children: [
          ScreenTitle(title: "الاعدادات", hasOptions: false),
          AppSizes.h10,
          SettingsNotificationSection(),
          AppSizes.h10,
          SettingsThemesSection(),
          AppSizes.h10,
          SettingsAppInfoSection(),
        ],
      ),
    );
  }
}
