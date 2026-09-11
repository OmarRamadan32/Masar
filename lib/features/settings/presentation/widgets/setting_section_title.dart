import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class SettingSectionTitle extends StatelessWidget {
  const new({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Text( title, style: AppStyles.secondaryMedium14);
  }
}
