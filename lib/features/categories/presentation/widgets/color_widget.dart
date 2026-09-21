import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  const new({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: 28,
      height: 28,
      decoration: ShapeDecoration(
        shape: CircleBorder(
          side: isSelected
              ? const BorderSide(color: Colors.black, width: 2)
              : BorderSide.none,
        ),
        color: color,
      ),
    );
  }
}
