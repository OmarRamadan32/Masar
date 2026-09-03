import 'package:flutter/material.dart';
import 'package:masar/core/routing/app_router.dart';
import 'package:masar/core/theme/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Masar());
}

class Masar extends StatelessWidget {
  const Masar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'مسار',
      theme: AppThemes.lightTheme,
      themeMode: ThemeMode.light,

      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      // we returned a media query widget to add a text scaling feature to the app
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: MediaQuery(
            data: mediaQueryData.copyWith(
              textScaler: mediaQueryData.textScaler.clamp(
                minScaleFactor: 0.8,
                maxScaleFactor: 1.2,
              ),
            ),
            child: child!,
          ),
        );
      },
    );
  }
}
