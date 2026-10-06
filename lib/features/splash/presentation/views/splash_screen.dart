import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/routing/routes.dart';
import 'package:masar/core/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // 1. الانتظار لمدة 3 ثوانٍ
    await Future.delayed(const Duration(milliseconds: 3500 ));

    if (!mounted) return;

    context.go(AppRoutes.notes);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image(image: AssetImage('assets/images/logo2.png')),
            ),
            CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
