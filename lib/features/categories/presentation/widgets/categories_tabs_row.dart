import 'package:flutter/material.dart';
import 'package:masar/features/categories/presentation/widgets/categories_teb_item.dart';

class CategoriesTabsRow extends StatefulWidget {
  const new({super.key});

  @override
  State<CategoriesTabsRow> createState() => _CategoriesTabsRowState();
}

class _CategoriesTabsRowState extends State<CategoriesTabsRow> {
  int selectedIndex = 0;
  final List<String> categories = const ["شخصي", "العمل", "الدراسة", "السفر"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: CategoriesTabItem(
                  title: categories[index],
                  isSelected: index == selectedIndex,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}