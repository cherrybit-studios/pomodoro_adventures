import 'package:flutter/material.dart';
import 'package:phased/phased.dart';

class Bounce extends StatefulWidget {
  const Bounce({
    required this.child,
    required this.offset,
    this.curve = Curves.easeOutCubic,
    super.key,
  });

  final Widget child;
  final Offset offset;
  final Curve curve;

  @override
  State<Bounce> createState() => _BounceState();
}

class _BounceState extends State<Bounce> {
  late final state = PhasedState<bool>(
    values: [true, false],
    ticker: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) {
    return _Bounce(
      state: state,
      offset: widget.offset,
      curve: widget.curve,
      child: widget.child,
    );
  }
}

class _Bounce extends Phased<bool> {
  const _Bounce({
    required super.state,
    required this.offset,
    required this.child,
    required this.curve,
  });

  final Widget child;
  final Offset offset;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 500),
      curve: curve,
      offset: state.value ? Offset.zero : offset,
      child: child,
    );
  }
}
