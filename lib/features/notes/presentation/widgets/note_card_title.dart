import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class NoteCardTitle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("خطة سفر يناير", style: AppStyles.primaryBold16);
  }
}
