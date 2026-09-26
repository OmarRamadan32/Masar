import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';
import 'package:masar/features/notes/presentation/widgets/notes_grid_view.dart';

class NotesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  void initState() {
    context.read<NotesCubit>().getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      canPop: false,
      child: Column(
        children: [
          ScreenTitle(
            title: "الملاحظات",
            hasOptions: true,
            addItemScreenPath: AppRoutes.addNote,
          ),
          AppSizes.h10,
          Expanded(child: NotesGridView()),
        ],
      ),
    );
  }
}
