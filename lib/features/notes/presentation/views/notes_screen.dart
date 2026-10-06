import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/cubit/selection_cubit.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/notes/data/models/note_model.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:masar/features/notes/presentation/widgets/notes_grid_view.dart';
import 'package:masar/features/notes/presentation/widgets/selectable_notes_view.dart';

class NotesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  void _deleteNotes(BuildContext context) {
    NotesCubit notesCubit = context.read<NotesCubit>();
    SelectionCubit selectionCubit = context.read<SelectionCubit>();
    if (selectionCubit.state.selectedItems.isNotEmpty) {
      notesCubit.deleteNotes(
        notes: selectionCubit.state.selectedItems.cast<NoteModel>(),
      );
      selectionCubit.clearSelection();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('تم حذف الملاحظات')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك حدد الملاحظات المراد حذفها')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      canPop: false,
      child: BlocProvider(
        create: (context) => SelectionCubit(),
        child: BlocBuilder<SelectionCubit, SelectionState>(
          builder: (context, state) {
            if (state.isSelectionMode) {
              return Column(
                children: [
                  ScreenTitle(
                    isSelectMode: true,
                    onDelete: () {
                      _deleteNotes(context);
                    },
                    title: "الملاحظات",
                    hasOptions: true,
                  ),

                  AppSizes.h10,
                  const Expanded(child: SelectableNotesView()),
                ],
              );
            } else {
              return const Column(
                children: [
                  ScreenTitle(
                    hasSelectionMode: true,
                    isSelectMode: false,
                    addItemScreenPath: AppRoutes.addNote,
                    title: "الملاحظات",
                    hasOptions: true,
                  ),

                  AppSizes.h10,
                  Expanded(child: NotesGridView()),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
