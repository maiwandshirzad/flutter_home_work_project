import 'package:flutter/material.dart';

void main() {
  runApp(const DartFlutterIntegrationApp());
}

class DartFlutterIntegrationApp extends StatelessWidget {
  const DartFlutterIntegrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 3 Labs',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange), useMaterial3: true),
      home: const StudentAnalyzerScreen(),
    );
  }
}

/// Lab 5: Flutter + Dart UI Integration
class StudentAnalyzerScreen extends StatelessWidget {
  const StudentAnalyzerScreen({super.key});

  final String courseTitle = 'Advanced Mobile Programming';
  final int semester = 7;
  final bool isActive = true;

  @override
  Widget build(BuildContext context) {
    final List<String> topics = ['Dart Basics', 'Null Safety', 'Classes & OOP', 'Lists & Loops', 'Flutter UI'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture 3: Dart + Flutter'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Course: $courseTitle', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text('Semester: $semester  |  Status: ${isActive ? "Active" : "Inactive"}'),
            const Divider(height: 32),
            const Text('Covered Topics:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text('${index + 1}')),
                      title: Text(topics[index]),
                      subtitle: Text('Module ${index + 1} completed'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
