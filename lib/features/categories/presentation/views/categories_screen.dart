import 'package:flutter/material.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_sizes.dart';
import 'package:masar/core/widgets/custom_screen.dart';
import 'package:masar/features/categories/presentation/widgets/categories_tabs_row.dart';
import 'package:masar/features/categories/presentation/widgets/category_view_switcher.dart';
import 'package:masar/features/main_layout/widgets/screen_title.dart';
import 'package:masar/features/notes/presentation/widgets/notes_grid_view.dart';

class CategoriesScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScreen(
      canPop: false,
      child: Column(
        children: [
          ScreenTitle(
            title: "الفئات",
            hasOptions: true,
            addItemScreenPath: AppRoutes.addCategory,
          ),
          AppSizes.h10,
          CategoriesTabsRow(),
          AppSizes.h20,
          CategoryViewSwitcher(),
          AppSizes.h10,
          Expanded(child: NotesGridView()),
        ],
      ),
    );
  }
}
