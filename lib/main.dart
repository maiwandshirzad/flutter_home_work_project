import 'package:flutter/material.dart';
import 'package:flutter_hw/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Work',
      home: HomeScreen(),
    );
  }
}
