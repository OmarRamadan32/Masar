import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/core/widgets/opstions_picker.dart';

class AddNoteScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(canPop: true, child: Column(
        children: [
          CustomTextField(isMultiLine: false, initialValue: "عنوان الملاحظة"),
          AppSizes.h10,
          OptionsPicker(),
                    AppSizes.h10,
          CustomTextField(initialValue: "الملاحظة", isMultiLine: true),
        ],
      ),);
  }
}
