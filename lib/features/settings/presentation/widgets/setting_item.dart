import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/settings/presentation/widgets/setting_item_details.dart';
import 'package:masar/features/settings/presentation/widgets/setting_item_icon.dart';

class SettingItem extends StatelessWidget {
  const new({
    super.key,
    required this.itemIcon,
    required this.itemIconColor,
    required this.itemIconBackgroundColor,
    required this.itemTitle,
    required this.itemSubtitle,
     this.leadingWidget,
  });
  final IconData itemIcon;
  final Color itemIconColor;
  final Color itemIconBackgroundColor;
  final String itemTitle, itemSubtitle;
  final Widget? leadingWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SettingItemIcon(
          icon: itemIcon,
          iconColor: itemIconColor,
          backgroundColor: itemIconBackgroundColor,
        ),
        AppSizes.w16,
        SettingItemDetails(title: itemTitle, subtitle: itemSubtitle),
        const Spacer(),
        leadingWidget ?? const SizedBox.shrink(),
      ],
    );
  }
}
