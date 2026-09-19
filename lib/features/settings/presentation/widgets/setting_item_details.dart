import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class SettingItemDetails extends StatelessWidget {
  const new({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.primaryBold16),
        Text(
          subtitle,
          style: AppStyles.secondaryRegular11.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}
