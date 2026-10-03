import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/core/constants/app_enums.dart';
import 'package:masar/core/constants/app_options.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_button.dart';
import 'package:masar/core/widgets/custom_option_widget.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/core/widgets/custom_text_field.dart';
import 'package:masar/core/widgets/opstions_picker.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:masar/features/tasks/data/models/task_model.dart';
import 'package:masar/features/tasks/presentation/cubit/tasks_cubit.dart';

class EditTaskScreen extends StatefulWidget {
  const new({super.key, required this.task});
  final TaskModel task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  // Initialize controllers
  @override
  void initState() {
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description ?? '';
    selectedCategory = widget.task.category;
    priority = widget.task.priority;
    repeatCount = widget.task.repeatCount;
    repeatType = widget.task.repeatType;
    context.read<CategoriesCubit>().getCategories();
    super.initState();
  }

  Future<void> _updateTask(BuildContext context) async {
    if (titleController.text.isEmpty ||
        priority == null ||
        repeatCount == null ||
        repeatType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('من فضلك أكمل الحقول المطلوبة')),
      );
    } else {
      TasksCubit tasksCubit = context.read<TasksCubit>();
      CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();
      widget.task.title = titleController.text;
      widget.task.description = descriptionController.text;
      widget.task.priority = priority!;
      widget.task.repeatCount = repeatCount!;
      widget.task.repeatType = repeatType!;
      widget.task.category = selectedCategory;
      await tasksCubit.updateTask(task: widget.task);
      categoriesCubit.getCategories();
    }
  }

  // Define variables
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  CategoryModel? selectedCategory;
  String? priority;
  int? repeatCount;
  String? repeatType;
  // Dispose controllers
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CategoriesCubit categoriesCubit = context.read<CategoriesCubit>();
    return BlocListener<TasksCubit, TasksState>(
      listener: (BuildContext context, TasksState state) {
        if (state is TasksLoaded) {
          context.pop();
        }
      },
      child: CustomScreen(
        canPop: true,
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: ScreenTitle(title: "اضافة مهمة", hasOptions: false),
            ),
            const SliverToBoxAdapter(child: AppSizes.h10),
            SliverToBoxAdapter(
              child: CustomTextField(
                initialValue: widget.task.title,
                controller: titleController,
                isTitle: true,
                type: CustomTextFieldType.normalTextField,
                hintText: "عنوان المهمة",
              ),
            ),
            const SliverToBoxAdapter(child: AppSizes.h10),
            SliverToBoxAdapter(
              child: OptionsPicker(
                onSelect: (value) {
                  if (value != null) {
                    selectedCategory = categoriesCubit.categories.firstWhere(
                      (element) => element.name == value,
                    );
                  } else {
                    selectedCategory = null;
                  }
                },
                title: "القسم",
                titleIcon: IconsaxPlusLinear.category_2,
                initialOption: widget.task.category?.name,
                optionsList: categoriesCubit.categories
                    .map((e) => e.name)
                    .toList(),
              ),
            ),
            const SliverToBoxAdapter(child: AppSizes.h10),
            SliverToBoxAdapter(
              child: OptionsPicker(
                initialOption: widget.task.priority,
                onSelect: (value) {
                  priority = value;
                },
                titleIcon: IconsaxPlusLinear.status_up,
                title: "درجة الأولوية *",
                optionsList: AppOptions.priorityOptions,
              ),
            ),
            const SliverToBoxAdapter(child: AppSizes.h10),
            SliverToBoxAdapter(
              child: OptionsPicker(
                initialOption: widget.task.repeatCount.toString() == "1"
                    ? "بدون تكرار"
                    : widget.task.repeatCount == 9999999
                    ? "لا نهائي"
                    : widget.task.repeatCount.toString(),
                onSelect: (value) {
                  if (value == AppOptions.infinite ||
                      value == 9999999.toString()) {
                    repeatCount = 9999999;
                  } else if (value == AppOptions.noRepeat ||
                      value == "بدون تكرار") {
                    repeatCount = 1;
                  } else {
                    repeatCount = int.parse(value!);
                  }
                },
                titleIcon: IconsaxPlusLinear.repeat,
                title: "عدد مرات التكرار *",
                optionsList: AppOptions.taskCount,
                customOption: const CustomOptionWidget(
                  title: "مخصص",
                  icon: IconsaxPlusBold.repeat_circle,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: AppSizes.h10),
            SliverToBoxAdapter(
              child: OptionsPicker(
                initialOption: widget.task.repeatType,
                onSelect: (value) {
                  repeatType = value;
                },
                title: "التكرار *",
                titleIcon: IconsaxPlusLinear.calendar,
                optionsList: AppOptions.taskRepeat,
                customOption: const CustomOptionWidget(
                  title: "مخصص",
                  icon: IconsaxPlusBold.calendar,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: AppSizes.h10),

            SliverFillRemaining(
              hasScrollBody: false,
              fillOverscroll: false,
              child: Column(
                children: [
                  Expanded(
                    child: CustomTextField(
                      initialValue: widget.task.description,
                      controller: descriptionController,
                      type: CustomTextFieldType.infinityTextField,
                      hintText: "ملاحظات",
                    ),
                  ),
                  AppSizes.h10,
                  CustomButton(
                    buttonTitle: "إتمام",
                    onPress: () {
                      _updateTask(context);
                    },
                  ),
                  AppSizes.h10,
                ],
              ),
            ),

            const SliverToBoxAdapter(child: AppSizes.h10),
          ],
        ),
      ),
    );
  }
}
