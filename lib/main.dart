import 'package:flutter/material.dart';

void main() {
  runApp(const AnimationsApp());
}

class AnimationsApp extends StatelessWidget {
  const AnimationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 10 Labs',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const AnimationLabsScreen(),
    );
  }
}

class AnimationLabsScreen extends StatefulWidget {
  const AnimationLabsScreen({super.key});

  @override
  State<AnimationLabsScreen> createState() => _AnimationLabsScreenState();
}

class _AnimationLabsScreenState extends State<AnimationLabsScreen> with TickerProviderStateMixin {
  // Lab 1: AnimatedContainer state
  bool _expanded = false;

  // Lab 2: AnimatedOpacity & AnimatedCrossFade state
  bool _visible = true;
  bool _crossFadeFirst = true;

  // Lab 3: AnimationController + Tween + ScaleTransition
  late final AnimationController _scaleController;
  late final Animation<double> _scaleAnimation;

  // Lab 4: AnimatedBuilder controller
  late final AnimationController _rotateController;

  // Lab 5: Staggered animation controller & intervals
  late final AnimationController _staggeredController;
  late final Animation<double> _staggeredFade;
  late final Animation<Offset> _staggeredSlide;

  @override
  void initState() {
    super.initState();

    // Lab 3 setup
    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.easeInOut),
    );

    // Lab 4 setup
    _rotateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Lab 5 setup (Staggered Animation with Interval)
    _staggeredController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _staggeredFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _staggeredController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );
    _staggeredSlide = Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _staggeredController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotateController.dispose();
    _staggeredController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 10: Flutter Animations')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Lab 1: AnimatedContainer
            const Text('Lab 1: AnimatedContainer (Implicit)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              width: _expanded ? 240 : 120,
              height: _expanded ? 120 : 70,
              decoration: BoxDecoration(
                color: _expanded ? Colors.teal : Colors.deepOrange,
                borderRadius: BorderRadius.circular(_expanded ? 24 : 8),
              ),
              alignment: Alignment.center,
              child: Text(
                _expanded ? 'Expanded!' : 'Tap Toggle',
                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => setState(() => _expanded = !_expanded),
              child: const Text('Toggle Container'),
            ),
            const Divider(height: 32),

            // Lab 2: AnimatedOpacity & AnimatedCrossFade
            const Text('Lab 2: AnimatedOpacity & AnimatedCrossFade', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 400),
              child: const Text('Fading Text Notification', style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
            const SizedBox(height: 8),
            AnimatedCrossFade(
              firstChild: const Icon(Icons.lock, size: 48, color: Colors.red),
              secondChild: const Icon(Icons.lock_open, size: 48, color: Colors.green),
              crossFadeState: _crossFadeFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 400),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () => setState(() => _visible = !_visible), child: const Text('Toggle Fade')),
                TextButton(onPressed: () => setState(() => _crossFadeFirst = !_crossFadeFirst), child: const Text('Toggle Lock')),
              ],
            ),
            const Divider(height: 32),

            // Lab 3: ScaleTransition + AnimationController
            const Text('Lab 3: Explicit ScaleTransition', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ScaleTransition(
              scale: _scaleAnimation,
              child: const Icon(Icons.favorite, size: 50, color: Colors.red),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _scaleController.forward(), child: const Text('Grow')),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: () => _scaleController.reverse(), child: const Text('Shrink')),
              ],
            ),
            const Divider(height: 32),

            // Lab 4: AnimatedBuilder Rotation with Loop Controls
            const Text('Lab 4: AnimatedBuilder (Rotation with repeat/stop)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            AnimatedBuilder(
              animation: _rotateController,
              builder: (context, child) => Transform.rotate(
                angle: _rotateController.value * 6.283,
                child: child,
              ),
              child: const Icon(Icons.refresh, size: 50, color: Colors.deepPurple),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _rotateController.repeat(), child: const Text('Repeat')),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: () => _rotateController.stop(), child: const Text('Stop')),
              ],
            ),
            const Divider(height: 32),

            // Lab 5: Staggered Entrance Animation
            const Text('Lab 5: Staggered Animation (Fade then Slide)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            FadeTransition(
              opacity: _staggeredFade,
              child: SlideTransition(
                position: _staggeredSlide,
                child: Card(
                  color: Colors.deepPurple.shade50,
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Staggered Onboarding Card Entrance', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _staggeredController.reset();
                _staggeredController.forward();
              },
              child: const Text('Play Staggered Entrance'),
            ),
          ],
        ),
      ),
    );
  }
}
