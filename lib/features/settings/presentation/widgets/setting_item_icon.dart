import 'package:flutter/material.dart';

class SettingItemIcon extends StatelessWidget {
  const new({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(icon, size: 20, color: iconColor),
    );
  }
}