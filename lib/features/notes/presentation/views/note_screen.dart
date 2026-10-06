import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/utils/date_formatter.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:masar/features/notes/data/models/note_model.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';

class NoteScreen extends StatefulWidget {
  const new({super.key, required this.note});
  final NoteModel note;

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    oldNote = NoteModel(
      title: widget.note.title,
      content: widget.note.content,
      date: widget.note.date,
      time: widget.note.time,
    );
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
    titleController.addListener(_onTextChanged);
    contentController.addListener(_onTextChanged);
  }

  void _onTextChanged() async {
    await updateNote();
    setState(() {});
  }

  Future<void> updateNote() async {
    NotesCubit notesCubit = context.read<NotesCubit>();
    CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();
    widget.note.title = titleController.text.trim();
    widget.note.content = contentController.text.trim();
    widget.note.date = DateFormatter.formatDateOnly(DateTime.now());
    widget.note.time = DateFormatter.formatTimeOnly(DateTime.now());
    await notesCubit.updateNote(note: widget.note);
    categoriesCubit.getCategories();
  }

  bool get isChanged {
    return widget.note.title.trim() != oldNote.title.trim() ||
        widget.note.content.trim() != oldNote.content.trim();
  }

  Future<void> restoreOldNote() async {
    titleController.text = oldNote.title;
    contentController.text = oldNote.content;
    NotesCubit notesCubit = context.read<NotesCubit>();
    widget.note.title = oldNote.title;
    widget.note.content = oldNote.content;
    widget.note.date = oldNote.date;
    widget.note.time = oldNote.time;
    await notesCubit.updateNote(note: widget.note);
  }

  @override
  void dispose() {
    titleController.removeListener(_onTextChanged);
    contentController.removeListener(_onTextChanged);
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  late NoteModel oldNote;

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      action: isChanged
          ? IconButton(
              onPressed: () async {
                await restoreOldNote();
              },
              icon: const Icon(IconsaxPlusLinear.back_square),
            )
          : const SizedBox.shrink(),
      canPop: true,
      child: Column(
        children: [
          CustomTextField(
            isTitle: true,
            controller: titleController,
            type: CustomTextFieldType.normalTextField,
            initialValue: widget.note.title,
          ),
          AppSizes.h10,
          Expanded(
            child: CustomTextField(
              controller: contentController,
              initialValue: widget.note.content,
              type: CustomTextFieldType.infinityTextField,
            ),
          ),
        ],
      ),
    );
  }
}
