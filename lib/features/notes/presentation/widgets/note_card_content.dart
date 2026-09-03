import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_styles.dart';

class NoteCardContent extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "التأكد من تفاصيل حجز الطيران، مراجعة تأكيد الفندق، وإعداد قائمة الأماكن السياحية المخطط لزيارتها",
      style: AppStyles.primaryRegular14,
    );
  }
}
