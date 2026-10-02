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

class CategoriesScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    context.read<CategoriesCubit>().getCategories();
    super.initState();
  }

  int index = 0;
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
                return Expanded(
                  child: Column(
                    children: [
                      CategoriesTabsRow(
                        selectedCategoryIndex: (selctedIndex) {
                          index = selctedIndex;
                          setState(() {});
                        },
                        categories: state.categories,
                      ),
                      AppSizes.h20,
                      const CategoryViewSwitcher(),
                      AppSizes.h10,
                      Expanded(
                        child: NotesGridView(
                          categoryName: state.categories[index].name,
                        ),
                      ),
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
