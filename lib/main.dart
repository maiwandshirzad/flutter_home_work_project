import 'package:flutter/material.dart';

void main() {
  runApp(const StylingApp());
}

class StylingApp extends StatefulWidget {
  const StylingApp({super.key});

  @override
  State<StylingApp> createState() => _StylingAppState();
}

class _StylingAppState extends State<StylingApp> {
  // Lab 5: Light & Dark Theme switching
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 9 Labs',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)), // Lab 1: ARGB custom hex color
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0), brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: StylingDashboard(onToggleTheme: _toggleTheme),
    );
  }
}

class StylingDashboard extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const StylingDashboard({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture 9: Widget Styling'),
        actions: [
          IconButton(
            onPressed: onToggleTheme,
            icon: Icon(Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Light/Dark',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Lab 3: BoxDecoration with LinearGradient, BorderRadius, and BoxShadow
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF1976D2), Color(0xFF7B1FA2)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
              child: Row(
                children: [
                  // Lab 3: Circular Container avatar
                  Container(
                    width: 64,
                    height: 64,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: const Icon(Icons.person, size: 40, color: Color(0xFF1976D2)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Ahmad Rahimi', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text('Software Engineering Student', style: TextStyle(color: Colors.white70, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Lab 4: Stack & Positioned badge overlay
            const Text('Lab 4: Stack & Positioned Badging', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Stack(
                children: [
                  Container(
                    height: 140,
                    color: Theme.of(context).colorScheme.primaryContainer,
                    alignment: Alignment.center,
                    child: const Icon(Icons.image, size: 60),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text('NEW', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Positioned(
                    bottom: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black54,
                      child: const Text('Featured Card Overlay', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Lab 1: Typography and Theme.of(context) consumption
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Theme ColorScheme Palette:', style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    Text('Primary Color: ${Theme.of(context).colorScheme.primary}', style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                    Text('Surface Color: ${Theme.of(context).colorScheme.surface}'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
