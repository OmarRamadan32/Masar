import 'package:flutter/material.dart';
import 'package:masar/core/widgets/selectable_item.dart';

class SelectableView extends StatefulWidget {
  const new({super.key, required this.item, required this.itemCount});
  final Widget item;
  final int itemCount;
  // instead of passing itemCount and item, we will pass List<Widget> items

  @override
  State<SelectableView> createState() => _SelectableViewState();
}

class _SelectableViewState extends State<SelectableView> {
  List<int> selectedIndexes = [];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.itemCount,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedIndexes.contains(index)) {
                  selectedIndexes.remove(index);
                } else {
                  selectedIndexes.add(index);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SelectableItem(
                item: widget.item,
                isSelected: selectedIndexes.contains(index),
              ),
            ),
          );
        },
      ),
    );
  }
}

