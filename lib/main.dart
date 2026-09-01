import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:masar/core/router/app_router.dart';

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
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      // we returned a media query widget to add a text scaling feature to the app
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return MediaQuery(data: mediaQueryData.copyWith(
          textScaler: mediaQueryData.textScaler.clamp(
            minScaleFactor: 0.8,
            maxScaleFactor: 1.2,
          ),
        ), child: child!,);
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const new({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: null, // a bottom navigation bar will be added Here
    );
  }
}
