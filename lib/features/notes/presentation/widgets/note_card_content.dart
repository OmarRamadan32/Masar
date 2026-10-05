import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class NoteCardContent extends StatelessWidget {
  const new({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: 5,
      text,
      style: AppStyles.primaryRegular14,
    );
  }
}
