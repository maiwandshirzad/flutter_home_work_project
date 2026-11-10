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
import 'package:flutter/material.dart';

void main() {
  runApp(const CommonWidgetsApp());
}

class CommonWidgetsApp extends StatelessWidget {
  const CommonWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 5 Labs',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue), useMaterial3: true),
      home: const CommonWidgetsScreen(),
    );
  }
}

class CommonWidgetsScreen extends StatelessWidget {
  const CommonWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lab 1: SafeArea protection
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 5: Common Widgets I')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Lab 1: Container with size, padding, margin, alignment & decoration
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blue, width: 2),
                ),
                child: const Text('Lab 1: Container with Decoration & Padding', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 12),

              // Lab 2: Text and RichText with TextSpans and overflow handling
              Text(
                'Lab 2: Long Text Sample with ellipsis: Advanced Mobile Programming course focusing on Flutter widgets, constraints, layouts, and responsive cross-platform architectures.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey.shade800),
              ),
              const SizedBox(height: 8),
              RichText(
                text: TextSpan(
                  text: 'Enrollment: ',
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'CS.SE.0731 ',
                      style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: '(Fee: 500 AFN)',
                      style: TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Lab 3 & 4: Nested Row & Column Profile Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        child: Icon(Icons.person, size: 40),
                      ),
                      const SizedBox(width: 16),
                      // Lab 5: Expanded to resolve row overflow
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ahmad Rahimi', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            const Text('Semester 7 - Software Engineering'),
                            const SizedBox(height: 6),
                            Row(
                              children: const [
                                Icon(Icons.email, size: 16, color: Colors.grey),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'ahmad.rahimi@ku.edu.af',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
