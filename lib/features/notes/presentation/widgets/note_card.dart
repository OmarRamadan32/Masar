import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_category.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_content.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_date.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_title.dart';

class NoteCard extends StatelessWidget {
  const new({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.s10),
      decoration: BoxDecoration(
        color: AppColors.cardsColor,
        borderRadius: AppSizes.r16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [NoteCardCategory(), NoteCardDate()],
          ),
          AppSizes.h10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NoteCardTitle(),
              AppSizes.h10,
              NoteCardContent(text: text),
            ],
          ),
        ],
      ),
    );
  }
}
