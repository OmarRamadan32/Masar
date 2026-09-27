import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/utils/popup_utils.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:masar/features/notes/presentation/widgets/note_card.dart';

class NotesGridView extends StatelessWidget {
  const NotesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    NotesCubit notesCubit = context.read<NotesCubit>();
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        if (state is NotesLoaded) {
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            itemCount: notesCubit.notes.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPressStart: (LongPressStartDetails details) {
                  PopupMenuUtils.openOptions(
                    context,
                    details,
                    deleteText: 'حذف',
                    onDelete: () {
                      notesCubit.deleteNote(note: notesCubit.notes[index]);
                    },
                  );
                },
                onTap: () => context.push(
                  AppRoutes.note,
                  extra: notesCubit.notes[index],
                ),
                child: NoteCard(note: notesCubit.notes[index]),
              );
            },
          );
        } else if (state is NotesLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('لا يوجد ملاحظات'));
        }
      },
    );
  }
}
