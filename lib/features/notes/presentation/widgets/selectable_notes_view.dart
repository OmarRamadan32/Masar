import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/cubit/selection_cubit.dart';
import 'package:masar/core/widgets/selectable_item.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:masar/features/notes/presentation/widgets/note_card.dart';

class SelectableNotesView extends StatefulWidget {
  const new({super.key});

  @override
  State<SelectableNotesView> createState() => _SelectableNotesViewState();
}

class _SelectableNotesViewState extends State<SelectableNotesView> {
  @override
  Widget build(BuildContext context) {
    NotesCubit notesCubit = context.read<NotesCubit>();
    SelectionCubit selectionCubit = context.read<SelectionCubit>();
    return ListView.builder(
      itemCount: notesCubit.notes.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectionCubit.toggleItem(notesCubit.notes[index]);
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SelectableItem(
              item: NoteCard(note: notesCubit.notes[index]),
              isSelected: selectionCubit.state.selectedItems.contains(
                notesCubit.notes[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
