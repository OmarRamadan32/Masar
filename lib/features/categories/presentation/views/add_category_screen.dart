import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_button.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:masar/features/categories/presentation/widgets/colors_picker_widget.dart';
import 'package:masar/core/widgets/screen_title.dart';

class AddCategoryScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  late TextEditingController titleController;
  late TextEditingController noteController;
  int categoryColor = AppColors.categoriesColors[0];
  @override
  void initState() {
    titleController = TextEditingController();
    noteController = TextEditingController();
    super.initState();
  }

  Future<void> _addCategory() async {
    CategoriesCubit cubit = context.read<CategoriesCubit>();
    CategoryModel category = CategoryModel(
      name: titleController.text.trim(),
      color: categoryColor,
    );
    await cubit.addCategory(category: category);
  }

  @override
  void dispose() {
    titleController.dispose();
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoriesCubit, CategoriesState>(
      child: CustomScreen(
        canPop: true,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  AppSizes.h10,
                  const ScreenTitle(title: "اضافة قسم", hasOptions: false),
                  AppSizes.h10,
                  CustomTextField(
                    controller: titleController,
                    type: CustomTextFieldType.normalTextField,
                    hintText: "اسم القسم",
                  ),
                  AppSizes.h10,
                  CustomTextField(
                    controller: noteController,
                    type: CustomTextFieldType.multiLineTextField,
                    hintText: "ملاحظة",
                    maxLines: 3,
                  ),
                  AppSizes.h10,
                  ColorsPickerWidget(
                    onColorSelected: (selectedColor) {
                      categoryColor = selectedColor;
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    buttonTitle: "إتمام",
                    onPress: () async {
                      if (titleController.text.isNotEmpty) {
                        await _addCategory();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("يرجى ادخال اسم القسم")),
                        );
                      }
                    },
                  ),
                  AppSizes.h10,
                ],
              ),
            ),
          ],
        ),
      ),
      listener: (context, state) {
        if (state is CategoriesLoaded) {
          context.pop();
        }
      },
    );
  }
}
