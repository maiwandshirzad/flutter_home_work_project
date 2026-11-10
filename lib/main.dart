import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const CommonWidgetsPart2App());
}

class CommonWidgetsPart2App extends StatelessWidget {
  const CommonWidgetsPart2App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 6 Labs',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal), useMaterial3: true),
      home: const FormAndMediaScreen(),
    );
  }
}

class FormAndMediaScreen extends StatefulWidget {
  const FormAndMediaScreen({super.key});

  @override
  State<FormAndMediaScreen> createState() => _FormAndMediaScreenState();
}

class _FormAndMediaScreenState extends State<FormAndMediaScreen> {
  // Lab 4: Form state key and controllers
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String _loadedAssetText = 'Loading asset text...';
  String _selectedDept = 'Software Engineering';

  @override
  void initState() {
    super.initState();
    _loadAssetBundleText();
  }

  // Lab 3: AssetBundle loading
  Future<void> _loadAssetBundleText() async {
    try {
      final text = await rootBundle.loadString('assets/data/info.txt');
      setState(() => _loadedAssetText = text.trim());
    } catch (e) {
      setState(() => _loadedAssetText = 'AssetBundle demo ready (assets/data/info.txt)');
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registered: ${_nameController.text} ($_selectedDept)')),
      );
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Lab 5: OrientationBuilder adapting layout
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecture 6: Forms & Media'),
        actions: [
          // Lab 1: PopupMenuButton
          PopupMenuButton<String>(
            onSelected: (val) => setState(() => _selectedDept = val),
            itemBuilder: (context) => const [
              PopupMenuItem(value: 'Software Engineering', child: Text('Software Engineering')),
              PopupMenuItem(value: 'Computer Science', child: Text('Computer Science')),
              PopupMenuItem(value: 'Information Systems', child: Text('Information Systems')),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitForm,
        tooltip: 'Quick Submit',
        child: const Icon(Icons.check),
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final isPortrait = orientation == Orientation.portrait;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Lab 2: Network image with errorBuilder & BoxFit
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      'https://picsum.photos/400/160',
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.broken_image, size: 48, color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Lab 3 display
                  Text('AssetBundle Content: $_loadedAssetText', style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                  const Divider(height: 24),
                  // Lab 4: Validated Form
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: 'Full Name',
                            prefixIcon: Icon(Icons.person),
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => (val == null || val.trim().isEmpty) ? 'Please enter name' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => (val == null || !val.contains('@')) ? 'Enter a valid email' : null,
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(),
                          ),
                          validator: (val) => (val == null || val.length < 6) ? 'Minimum 6 characters' : null,
                        ),
                        const SizedBox(height: 16),
                        // Lab 1: Modern Button Types (Elevated, Outlined, Text)
                        Wrap(
                          spacing: 12,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: _submitForm,
                              icon: const Icon(Icons.send),
                              label: const Text('Submit Form'),
                            ),
                            OutlinedButton.icon(
                              onPressed: _resetForm,
                              icon: const Icon(Icons.refresh),
                              label: const Text('Reset'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Selected: $_selectedDept'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
