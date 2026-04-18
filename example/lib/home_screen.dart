import 'package:flutter/material.dart';
import 'package:snap_floater/snap_floater.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SnapFloaterController? _controller;
  late SnapFloaterState state;

  void _listener() => setState(() => state = _controller!.value);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final controller = SnapFloaterScope.of(context);
    if (_controller != null) return;
    _controller?.removeListener(_listener);
    _controller = controller;
    state = controller.value;
    _controller?.addListener(_listener);
  }

  @override
  void dispose() {
    _controller?.removeListener(_listener);
    super.dispose();
  }

  String get alignmentString {
    String coordinate(String name, double value) =>
        '$name:${value.toStringAsFixed(1)}';

    final buffer = StringBuffer()..write('Alignment: ');
    final alignment = state.alignment;
    final alignmentString = state.alignment.toString();
    if (alignmentString.startsWith('Alignment.')) {
      buffer.write('.${alignmentString.split('.').last}');
    } else {
      buffer.write(
        '${coordinate('x', alignment.x)}, ${coordinate('y', alignment.y)}',
      );
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Is dragging: ${state.isDragging}'),
                Row(
                  spacing: 10,
                  children: [
                    const Icon(Icons.back_hand_rounded),
                    Text('Is visible: ${state.isVisible}'),
                  ],
                ),
                Text(
                  alignmentString,
                ),
              ],
            ),
          ),
        ),
      );
}
