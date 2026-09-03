import 'package:flutter/material.dart';
import 'package:masar/features/notes/presentation/widgets/note_card.dart';

class NotesScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [NoteCard()],
    );
  }
}
