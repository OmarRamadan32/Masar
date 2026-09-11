import 'package:flutter/material.dart';

class SettingItemsDivider extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 40,
      child: Divider(thickness: 1, color: Color.fromARGB(26, 171, 179, 183)),
    );
  }
}
