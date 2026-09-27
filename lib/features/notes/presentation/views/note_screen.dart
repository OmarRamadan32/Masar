import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/utils/date_formatter.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
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
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);

    titleController.addListener(_onTextChanged);
    contentController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {});
  }

  void updateNote() async {
    NotesCubit notesCubit = context.read<NotesCubit>();
    widget.note.date = DateFormatter.formatDateOnly(DateTime.now());
    widget.note.time = DateFormatter.formatTimeOnly(DateTime.now());
    await notesCubit.updateNote(note: widget.note);
  }

  bool get isChanged {
    return titleController.text.trim() != widget.note.title ||
        contentController.text.trim() != widget.note.content;
  }

  @override
  void dispose() {
    titleController.removeListener(_onTextChanged);
    contentController.removeListener(_onTextChanged);
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      action: isChanged
          ? IconButton(
              onPressed: () async {
                widget.note.title = titleController.text.trim();
                widget.note.content = contentController.text.trim();
                updateNote();
                if (context.mounted) {
                  context.pop();
                }
              },
              icon: const Icon(Icons.check, color: AppColors.primaryColor),
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
