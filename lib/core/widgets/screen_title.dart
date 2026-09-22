import 'package:flutter/material.dart';
import 'package:masar/core/widgets/screen_title_normal_mode.dart';

class ScreenTitle extends StatelessWidget {
  const new({
    super.key,
    required this.title,
    this.addItemScreenPath,
    required this.hasOptions,
  });
  final String title;
  final String? addItemScreenPath;
  final bool hasOptions;
  // final State triggeredState;
  //(for example: Select Note State) if the current State is Select Note State it will return ScreenTitleSelectMode

  @override
  Widget build(BuildContext context) {
    /*
    this will return screen title based on the current State 
    */
    return ScreenTitleNormalMode(
      hasOptions: hasOptions,
      title: title,
      addItemScreenPath: addItemScreenPath,
    );
  }
}
