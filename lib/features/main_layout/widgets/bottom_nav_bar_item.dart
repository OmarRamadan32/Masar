import 'package:flutter/material.dart';
import 'package:masar/core/theme/app_colors.dart';
import 'package:masar/core/theme/app_styles.dart';

class BottomNavBarItem extends StatelessWidget {
  const new({
    super.key,
    required this.isActive,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  final bool isActive;
  final String title;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: Icon(
                icon,
                size: isActive == true ? 26 : 24,
                key: ValueKey<bool>(isActive),
                color: isActive
                    ? AppColors.primaryColor
                    : AppColors.inactiveBottomNavItemColor,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              title,
              style: isActive == true
                  ? AppStyles.secondaryMedium13
                  : AppStyles.secondaryMedium13.copyWith(
                      color: AppColors.inactiveBottomNavItemColor,
                      fontSize: 12,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
