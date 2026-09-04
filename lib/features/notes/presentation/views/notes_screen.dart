import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/main_layout/widgets/screen_title.dart';
import 'package:masar/features/notes/presentation/widgets/notes_grid_view.dart';

class NotesScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ScreenTitle(),
        AppSizes.h10,
        Expanded(child: NotesGridView()),
      ],
    );
  }
}
