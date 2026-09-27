import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/utils/date_formatter.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/core/widgets/opstions_picker.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:masar/features/notes/data/models/note_model.dart';
import 'package:masar/features/notes/presentation/cubit/notes_cubit.dart';

class AddNoteScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  @override
  void initState() {
    noteContentController = TextEditingController();
    noteTitleController = TextEditingController();
    context.read<CategoriesCubit>().getCategories();
    super.initState();
  }

  Future<void> addNote() async {
    NotesCubit notesCubit = context.read<NotesCubit>();
    String noteTitle = noteTitleController.text;
    String noteContent = noteContentController.text;
    //--
    NoteModel noteModel = NoteModel(
      title: noteTitle,
      content: noteContent,
      category: selectedCategory,
      date: DateFormatter.formatDateOnly(DateTime.now()),
      time: DateFormatter.formatTimeOnly(DateTime.now()),
    );
    await notesCubit.addNote(note: noteModel);
  }

  late TextEditingController noteTitleController;
  late TextEditingController noteContentController;
  CategoryModel? selectedCategory;

  @override
  void dispose() {
    noteTitleController.dispose();
    noteContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();
    return BlocListener<NotesCubit, NotesState>(
      listener: (BuildContext context, NotesState state) {
        if (state is NotesLoaded) {
          context.pop();
        }
      },
      child: CustomScreen(
        action: IconButton(
          onPressed: () {
            if (noteTitleController.text.isNotEmpty ||
                noteContentController.text.isNotEmpty) {
              addNote();
            } else {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("لا يوجد شئ للحقظ")));
            }
          },
          icon: const Icon(Icons.check, color: AppColors.primaryColor),
        ),
        canPop: true,
        child: Column(
          children: [
            const ScreenTitle(title: "اضافة ملاحظة", hasOptions: false),
            AppSizes.h10,
            CustomTextField(
              isTitle: true,
              controller: noteTitleController,
              type: CustomTextFieldType.normalTextField,
              hintText: "عنوان الملاحظة",
            ),
            AppSizes.h10,
            OptionsPicker(
              onSelect: (value) {
                if (value != null) {
                  selectedCategory = categoriesCubit.categories.firstWhere(
                    (element) => element.name == value,
                  );
                } else {
                  selectedCategory = null;
                }
              },
              titleIcon: IconsaxPlusLinear.category_2,
              title: "القسم",
              optionsList: categoriesCubit.categories
                  .map((e) => e.name)
                  .toList(),
            ),
            AppSizes.h10,
            Expanded(
              child: CustomTextField(
                controller: noteContentController,
                hintText: "الملاحظة",
                type: CustomTextFieldType.infinityTextField,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
