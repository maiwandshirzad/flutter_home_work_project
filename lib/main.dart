import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationApp());
}

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Lab 1 & Named Routes: Centralized route table
    return MaterialApp(
      title: 'Lecture 8 Labs',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedDepartment = 'None selected';

  // Lab 3: Returning data from route
  Future<void> _openSelectDepartment() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const SelectDepartmentScreen()),
    );
    if (result != null) {
      setState(() => _selectedDepartment = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 8: Navigation Hub')),
      // Lab 4: Drawer Navigation
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text('Student Portal\nNavigation', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.tab),
              title: const Text('Courses (Tabs)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const CoursesTabScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings (Named Route)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Lab 2: Passing Data across screens
            const Text('Lab 2: Passing Data to Details Screen', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProductDetailsScreen(
                      productId: 101,
                      productName: 'Flutter Architecture Handbook',
                      price: 35.0,
                    ),
                  ),
                );
              },
              child: const Text('View Product (ID: 101)'),
            ),
            const SizedBox(height: 20),

            // Lab 3: Returning a Result
            const Text('Lab 3: Await & Return Result from Route', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                title: Text('Selected Dept: $_selectedDepartment'),
                trailing: ElevatedButton(
                  onPressed: _openSelectDepartment,
                  child: const Text('Select'),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Lab 5: Tabs shortcut
            const Text('Lab 5: Tab Navigation', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            OutlinedButton.icon(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CoursesTabScreen())),
              icon: const Icon(Icons.tab),
              label: const Text('Open Courses TabBarView'),
            ),
          ],
        ),
      ),
    );
  }
}

// Lab 2: Screen receiving strongly typed constructor arguments
class ProductDetailsScreen extends StatelessWidget {
  final int productId;
  final String productName;
  final double price;

  const ProductDetailsScreen({
    super.key,
    required this.productId,
    required this.productName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Product ID: $productId', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Price: \$$price', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.green)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

// Lab 3: Route that pops with data
class SelectDepartmentScreen extends StatelessWidget {
  const SelectDepartmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final depts = ['Software Engineering', 'Computer Science', 'Information Systems'];
    return Scaffold(
      appBar: AppBar(title: const Text('Select Department')),
      body: ListView.builder(
        itemCount: depts.length,
        itemBuilder: (context, idx) {
          final dept = depts[idx];
          return ListTile(
            title: Text(dept),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.pop(context, dept),
          );
        },
      ),
    );
  }
}

// Lab 5: DefaultTabController, TabBar & TabBarView
class CoursesTabScreen extends StatelessWidget {
  const CoursesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Course Categories'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'All'),
              Tab(icon: Icon(Icons.play_circle), text: 'Active'),
              Tab(icon: Icon(Icons.check_circle), text: 'Completed'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('All Courses: Mobile, Web, AI')),
            Center(child: Text('Active Courses: Advanced Mobile Programming')),
            Center(child: Text('Completed Courses: Data Structures & Algorithms')),
          ],
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings (Named Route)')),
      body: const Center(child: Text('Application Settings Page')),
    );
  }
}
