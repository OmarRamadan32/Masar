import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_category.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_content.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_date.dart';
import 'package:masar/features/notes/presentation/widgets/note_card_title.dart';

class NoteCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cardsColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [NoteCardCategory(), NoteCardDate()],
          ),
          SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NoteCardTitle(),
              SizedBox(height: 10),
              NoteCardContent(),
            ],
          ),
        ],
      ),
    );
  }
}
