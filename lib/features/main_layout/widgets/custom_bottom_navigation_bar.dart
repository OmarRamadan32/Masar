import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/features/main_layout/widgets/bottom_nav_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const new({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: const Border(top: BorderSide(color: Colors.black12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomNavBarItem(
            isActive: navigationShell.currentIndex == 3,
            icon: IconsaxPlusBold.setting,
            title: 'الاعدادات',
            onTap: () {
              navigationShell.goBranch(3);
            },
          ),
          BottomNavBarItem(
            isActive: navigationShell.currentIndex == 2,
            icon: IconsaxPlusBold.category_2,
            title: 'الفئات',
            onTap: () {
              navigationShell.goBranch(2);
            },
          ),
          BottomNavBarItem(
            isActive: navigationShell.currentIndex == 1,
            icon: IconsaxPlusBold.task_square,
            title: 'المهام',
            onTap: () {
              navigationShell.goBranch(1);
            },
          ),
          BottomNavBarItem(
            isActive: navigationShell.currentIndex == 0,
            icon: IconsaxPlusBold.note_21,
            title: 'الملاحظات',
            onTap: () {
              navigationShell.goBranch(0);
            },
          ),
        ],
      ),
    );
  }
}
