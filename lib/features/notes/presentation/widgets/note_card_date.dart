import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class NoteCardDate extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "23/10/2022",
          style: AppStyles.secondaryRegular11.copyWith(height: 1),
        ),
        Text(
          "6:00 AM",
          style: AppStyles.secondaryRegular11.copyWith(height: 1),
        ),
      ],
    );
  }
}
