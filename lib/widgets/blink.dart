import 'package:flutter/material.dart';
import 'package:phased/phased.dart';

class Blink extends StatefulWidget {
  const Blink({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<Blink> createState() => _BlinkState();
}

class _BlinkState extends State<Blink> {
  late final state = PhasedState<bool>(
    values: [true, false],
    ticker: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) {
    return _Blink(state: state, child: widget.child);
  }
}

class _Blink extends Phased<bool> {
  const _Blink({required super.state, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: state.value ? 1.0 : 0.0,
      child: child,
    );
  }
}
