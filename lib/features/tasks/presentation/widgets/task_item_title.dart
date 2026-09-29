import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class TaskItemTitle extends StatelessWidget {
  const new({super.key, required this.isCompleted, required this.title});
  final bool isCompleted;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles.primaryBold14.copyWith(
        decoration: isCompleted
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
    );
  }
}