import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class TaskItemTitle extends StatelessWidget {
  const new({super.key, required this.isCompleted});
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Text(
      "تصميم واجهة التطبيق",
      style: AppStyles.primaryBold14.copyWith(
        decoration: isCompleted
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}