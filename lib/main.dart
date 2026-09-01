import 'package:flutter/material.dart';

void main() {
  runApp(const Masar());
}

class Masar extends StatelessWidget {
  const Masar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مسار',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
