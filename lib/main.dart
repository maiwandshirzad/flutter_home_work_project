import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Week2App());
}

class Week2App extends StatelessWidget {
  const Week2App({super.key});

  @override
  Widget build(BuildContext context) {
    // Lab 3: Global Theme with ColorScheme.fromSeed and Component Theming
    return MaterialApp(
      title: 'Lecture 2 Labs',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 15),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  Future<void> _launchFlutterDev() async {
    final Uri url = Uri.parse('https://flutter.dev');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open https://flutter.dev')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Lab 1: Hello World + Custom AppBar
      appBar: AppBar(
        title: const Text('Week 2: Hello World & Themes'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Lab 1: Styled centered text
            Text(
              'Hello Kabul University!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 16),
            // Lab 2: Hot Reload preservation demonstration counter
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text('Lab 2: State Preservation (Hot Reload test)'),
                    const SizedBox(height: 8),
                    Text('Counter Value: $_counter', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    ElevatedButton.icon(
                      onPressed: () => setState(() => _counter++),
                      icon: const Icon(Icons.add),
                      label: const Text('Increment State'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Lab 3: Local Theme Override
            Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
              ),
              child: Builder(
                builder: (localContext) {
                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(localContext).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Lab 3: Local Theme Overridden Section',
                          style: TextStyle(
                            color: Theme.of(localContext).colorScheme.onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Inherits Teal palette instead of Indigo root theme.',
                          style: TextStyle(color: Theme.of(localContext).colorScheme.onSecondaryContainer),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Lab 4: External Package (url_launcher)
            ElevatedButton.icon(
              onPressed: _launchFlutterDev,
              icon: const Icon(Icons.open_in_browser),
              label: const Text('Lab 4: Open pub.dev / flutter.dev'),
            ),
          ],
        ),
      ),
    );
  }
}
