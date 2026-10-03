import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/features/categories/presentation/cubit/categories_cubit.dart';
import 'package:masar/features/categories/presentation/widgets/categories_tabs_row.dart';
import 'package:masar/features/categories/presentation/widgets/category_view_switcher.dart';
import 'package:masar/core/widgets/screen_title.dart';
import 'package:masar/features/notes/presentation/widgets/notes_grid_view.dart';
import 'package:masar/features/tasks/presentation/widgets/tasks_list_view.dart';

class CategoriesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    CategoriesCubit cubit = context.read<CategoriesCubit>();
    cubit.getCategories();
    if (cubit.categories.isNotEmpty) {
      categoryName = cubit.categories[0].name;
    }
    super.initState();
  }

  int categoriesIndex = 0;
  int viewsIndex = 0;
  String? categoryName;
  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      canPop: false,
      child: Column(
        children: [
          const ScreenTitle(
            title: "الفئات",
            hasOptions: true,
            addItemScreenPath: AppRoutes.addCategory,
          ),
          AppSizes.h10,
          BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoaded && state.categories.isNotEmpty) {
                print(state.categories);
                List<Widget> views = [
                  NotesGridView(categoryName: categoryName),
                  TasksListView(categoryName: categoryName),
                ];
                return Expanded(
                  child: Column(
                    children: [
                      CategoriesTabsRow(
                        selectedCategoryIndex: (selctedIndex) {
                          categoriesIndex = selctedIndex;
                          categoryName = state.categories[selctedIndex].name;
                          setState(() {});
                        },
                        categories: state.categories,
                      ),
                      AppSizes.h20,
                      CategoryViewSwitcher(
                        onTab: (index) {
                          viewsIndex = index;
                          setState(() {});
                        },
                      ),
                      AppSizes.h10,
                      Expanded(child: views[viewsIndex]),
                    ],
                  ),
                );
              } else {
                return const Expanded(
                  child: Center(child: Text("لا توجد اي فئات لعرضها")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
