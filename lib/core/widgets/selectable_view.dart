import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masar/core/cubit/selection_cubit.dart';
import 'package:masar/core/widgets/selectable_item.dart';

class SelectableView extends StatefulWidget {
  const new({super.key, required this.widget, required this.item});
  final List<Widget> widget;
  final dynamic item;

  @override
  State<SelectableView> createState() => _SelectableViewState();
}

class _SelectableViewState extends State<SelectableView> {
  @override
  Widget build(BuildContext context) {
    SelectionCubit selectionCubit = context.read<SelectionCubit>();
    return Expanded( 
      child: ListView.builder(
        itemCount: selectionCubit.state.selectedItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectionCubit.toggleItem(widget.item);
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: SelectableItem(
                item: widget.widget[index],
                isSelected: selectionCubit.state.selectedItems[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
