import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/features/main_layout/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const new({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("مسار"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(color: Colors.black12, height: 1),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: navigationShell,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
