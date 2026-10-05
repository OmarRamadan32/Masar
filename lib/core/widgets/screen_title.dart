import 'package:flutter/material.dart';
import 'package:masar/core/widgets/screen_title_normal_mode.dart';
import 'package:masar/core/widgets/screen_title_select_mode.dart';

class ScreenTitle extends StatelessWidget {
  const new({
    super.key,
    required this.title,
    this.addItemScreenPath,
    required this.hasOptions,
    this.onDelete,
    this.isSelectMode,
  });
  final String title;
  final String? addItemScreenPath;
  final bool hasOptions;
  final Function()? onDelete;
  final bool? isSelectMode;

  @override
  Widget build(BuildContext context) {
    if (isSelectMode == true) {
      return ScreenTitleSelectMode(
        onDelete: () {
          onDelete!();
        },
      );
    } else {
      return ScreenTitleNormalMode(
        hasOptions: hasOptions,
        title: title,
        addItemScreenPath: addItemScreenPath,
      );
    }
  }
}
