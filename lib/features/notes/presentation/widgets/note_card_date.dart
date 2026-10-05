import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class NoteCardDate extends StatelessWidget {
  const new({super.key, required this.date, required this.time});
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(date, style: AppStyles.secondaryRegular11.copyWith(height: 1)),
        Text(time, style: AppStyles.secondaryRegular11.copyWith(height: 1)),
      ],
    );
  }
}
