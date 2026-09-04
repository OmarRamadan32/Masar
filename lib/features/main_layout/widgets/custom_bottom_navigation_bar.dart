import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:masar/features/main_layout/widgets/bottom_nav_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onItemTapped(int index) {
    if (index == navigationShell.currentIndex) return;

    navigationShell.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // قائمة بيانات أزرار الـ Navigation
    final navItems = [
      (icon: IconsaxPlusBold.note_21, title: 'الملاحظات'),
      (icon: IconsaxPlusBold.task_square, title: 'المهام'),
      (icon: IconsaxPlusBold.category_2, title: 'الفئات'),
      (icon: IconsaxPlusBold.setting, title: 'الإعدادات'),
    ];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(color: Colors.black12, width: 0.5),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(navItems.length, (index) {
              final item = navItems[index];
              return BottomNavBarItem(
                isActive: navigationShell.currentIndex == index,
                icon: item.icon,
                title: item.title,
                onTap: () => _onItemTapped(index),
              );
            }),
          ),
        ),
      ),
    );
  }
}
