import 'package:flutter/material.dart';

void main() {
  runApp(const GesturesApp());
}

class GesturesApp extends StatelessWidget {
  const GesturesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lecture 7 Labs',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), useMaterial3: true),
      home: const GesturesLabScreen(),
    );
  }
}

class GesturesLabScreen extends StatefulWidget {
  const GesturesLabScreen({super.key});

  @override
  State<GesturesLabScreen> createState() => _GesturesLabScreenState();
}

class _GesturesLabScreenState extends State<GesturesLabScreen> {
  // Lab 1: Tap & Double Tap state
  Color _boxColor = Colors.blue;
  bool _isFavorited = false;
  String _tapCoords = 'None';

  // Lab 3: Drag & Pan state
  Offset _dragPosition = Offset.zero;

  // Lab 4: Swipe state
  double _cardSwipeOffset = 0.0;

  // Lab 5: Pinch / Scale state
  double _currentScale = 1.0;
  double _baseScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lecture 7: Gestures')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Lab 1: Tap & Double Tap with coordinates & InkWell comparison
            const Text('Lab 1: Tap (Color), Double Tap (Fav), and Coordinates', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => setState(() => _boxColor = _boxColor == Colors.blue ? Colors.amber : Colors.blue),
              onDoubleTap: () => setState(() => _isFavorited = !_isFavorited),
              onTapDown: (details) => setState(() => _tapCoords = '(${details.localPosition.dx.toInt()}, ${details.localPosition.dy.toInt()})'),
              child: Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(color: _boxColor, borderRadius: BorderRadius.circular(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Tap me! Pos: $_tapCoords', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 12),
                    Icon(_isFavorited ? Icons.favorite : Icons.favorite_border, color: Colors.white),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Lab 2: Long Press triggering Modal Bottom Sheet
            const Text('Lab 2: Long Press for Context Menu', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onLongPress: () {
                showModalBottomSheet(
                  context: context,
                  builder: (ctx) => Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        ListTile(leading: Icon(Icons.share), title: Text('Share Item')),
                        ListTile(leading: Icon(Icons.delete), title: Text('Delete Item')),
                      ],
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.touch_app),
                  title: const Text('Long press this card for actions'),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Lab 3: Drag / Pan
            const Text('Lab 3: Freeform Drag / Pan', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  Positioned(
                    left: 20 + _dragPosition.dx,
                    top: 20 + _dragPosition.dy,
                    child: GestureDetector(
                      onPanUpdate: (details) => setState(() => _dragPosition += details.delta),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(color: Colors.purple, shape: BoxShape.circle),
                        child: const Icon(Icons.pan_tool, color: Colors.white, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Lab 4: Horizontal Swipe with Threshold
            const Text('Lab 4: Swipe with Threshold & Velocity', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onHorizontalDragUpdate: (details) => setState(() => _cardSwipeOffset += details.delta.dx),
              onHorizontalDragEnd: (details) {
                if (_cardSwipeOffset.abs() > 100 || (details.primaryVelocity ?? 0).abs() > 600) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Swiped ${_cardSwipeOffset > 0 ? "Right" : "Left"}!'),
                      action: SnackBarAction(label: 'Undo', onPressed: () => setState(() => _cardSwipeOffset = 0)),
                    ),
                  );
                }
                setState(() => _cardSwipeOffset = 0);
              },
              child: Transform.translate(
                offset: Offset(_cardSwipeOffset, 0),
                child: Card(
                  color: Colors.teal.shade100,
                  child: const ListTile(
                    leading: Icon(Icons.swipe),
                    title: Text('Swipe me horizontally'),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Lab 5: Pinch to Zoom (Clamped) + InteractiveViewer preview
            const Text('Lab 5: Pinch to Zoom (Scale clamped 0.8x - 2.5x)', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            GestureDetector(
              onScaleStart: (_) => _baseScale = _currentScale,
              onScaleUpdate: (details) {
                setState(() {
                  _currentScale = (_baseScale * details.scale).clamp(0.8, 2.5);
                });
              },
              child: Transform.scale(
                scale: _currentScale,
                child: Container(
                  height: 100,
                  width: 200,
                  color: Colors.orange.shade200,
                  alignment: Alignment.center,
                  child: Text('Zoom: ${_currentScale.toStringAsFixed(2)}x', style: const TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
