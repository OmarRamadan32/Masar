import 'package:flutter/material.dart';
import 'package:masar/features/categories/data/models/category_model.dart';
import 'package:masar/features/categories/presentation/widgets/categories_teb_item.dart';

class CategoriesTabsRow extends StatefulWidget {
  const new({super.key, required this.categories});
  final List<CategoryModel> categories;

  @override
  State<CategoriesTabsRow> createState() => _CategoriesTabsRowState();
}

class _CategoriesTabsRowState extends State<CategoriesTabsRow> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Row(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:widget.categories.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => setState(() => selectedIndex = index),
                child: CategoriesTabItem(
                  color: Color(widget.categories[index].color),
                  title:widget.categories[index].name,
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
