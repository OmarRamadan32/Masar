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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoaded) {
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
                CategoriesTabsRow(categories: state.categories),
                AppSizes.h20,
                const CategoryViewSwitcher(),
                AppSizes.h10,
                const Expanded(child: NotesGridView()),
              ],
            ),
          );
        } else {
          return const Center(child:Text("لا يوحد اي فئات بعد"));
        }
      },
    );
  }
}
