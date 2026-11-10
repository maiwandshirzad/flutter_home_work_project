import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 1 Labs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LifecycleLabScreen(),
    );
  }
}

/// Lab 2 & 3: Widget Tree Analysis & StatefulWidget Lifecycle Observation
class LifecycleLabScreen extends StatefulWidget {
  const LifecycleLabScreen({super.key});

  @override
  State<LifecycleLabScreen> createState() {
    print('>> [Lifecycle] createState() called');
    return _LifecycleLabScreenState();
  }
}

class _LifecycleLabScreenState extends State<LifecycleLabScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print('>> [Lifecycle] initState() called - one-time state initialization');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('>> [Lifecycle] didChangeDependencies() called');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      print('>> [Lifecycle] setState() called - mutating counter to $_counter');
    });
  }

  @override
  void dispose() {
    print('>> [Lifecycle] dispose() called - cleaning up resources');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('>> [Lifecycle] build() called - describing the UI subtree');
    // Lab 2 Widget Tree: MaterialApp -> Scaffold -> AppBar & Center -> Column -> Text & FloatingActionButton
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture 1: Lifecycle & Tree'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Lab 2: Widget Tree Hierarchy\n'
                    'MaterialApp -> Scaffold -> Center -> Column -> Text',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Lab 3: Observe console prints for lifecycle methods:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Text(
                'Count: $_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
