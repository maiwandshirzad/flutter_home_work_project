import 'package:flutter/material.dart';

void main() {
  runApp(const AdvancedDartFlutterApp());
}

class AdvancedDartFlutterApp extends StatelessWidget {
  const AdvancedDartFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 4: Advanced Dart UI',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const AdvancedDartScreen(),
    );
  }
}

class AdvancedDartScreen extends StatelessWidget {
  const AdvancedDartScreen({super.key});

  void _onNamedFunctionPressed() {
    print('>> Named function callback executed');
  }

  @override
  Widget build(BuildContext context) {
    final coreButtons = ['Dashboard', 'Courses'];
    final bool isStaff = true;

    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 4: Advanced Dart UI')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Dynamic Menu using Spread & Collection-if:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            // Using Spread and Collection-if in Flutter children list
            ...[
              for (final title in coreButtons)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ElevatedButton(onPressed: _onNamedFunctionPressed, child: Text(title)),
                ),
              if (isStaff)
                ElevatedButton(
                  onPressed: () => print('>> Anonymous function callback executed'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.amber.shade200),
                  child: const Text('Admin Panel (Collection-if)'),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
