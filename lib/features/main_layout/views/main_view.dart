import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/features/main_layout/widgets/custom_bottom_navigation_bar.dart';

class MainScreen extends StatelessWidget {
  const new({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: navigationShell,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: CustomBottomNavigationBar(navigationShell: navigationShell,),
      ),
    );
  }
}
