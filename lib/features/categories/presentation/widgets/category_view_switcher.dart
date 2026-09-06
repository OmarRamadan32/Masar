
import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/features/categories/presentation/widgets/category_view_switcher_item.dart';

class CategoryViewSwitcher extends StatefulWidget {
  const new({super.key});
  @override
  State<CategoryViewSwitcher> createState() => _CategoryViewSwitcherState();
}

class _CategoryViewSwitcherState extends State<CategoryViewSwitcher> {
  final List<String> viewsTitles = const ["الملاحظات", "المهام"];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.cardsColor),
      child: Row(
        children: List.generate(
          2,
          (index) => Expanded(
            child: GestureDetector(
              onTap: () {
                selectedIndex = index;
                setState(() {});
              },
              child: CategoryViewSwitcherItem(
                title: viewsTitles[index],
                isSelected: index == selectedIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
