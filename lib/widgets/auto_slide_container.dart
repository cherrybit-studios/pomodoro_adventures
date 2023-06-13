import 'package:flutter/material.dart';

class AutoSlideContainer extends StatefulWidget {
  const AutoSlideContainer({
    required this.builder,
    required this.width,
    required this.childWidth,
    required this.duration,
    super.key,
  });

  final WidgetBuilder builder;
  final double width;
  final double childWidth;
  final Duration duration;

  @override
  State<AutoSlideContainer> createState() => _AutoSlideContainerState();
}

class _AutoSlideContainerState extends State<AutoSlideContainer> {
  int _ids = 0;
  final Map<int, (double, double)> _offsets = {};

  @override
  void initState() {
    super.initState();

    for (var x = -widget.childWidth;
        x < (widget.width + widget.childWidth);
        x += widget.childWidth) {
      _offsets[_ids] = (x, x);
      _ids++;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final id in _offsets.keys) {
        _nextOffset(id);
      }
    });
  }

  void _nextOffset(int id) {
    final currentValue = _offsets[id];
    if (currentValue != null) {
      final newValue = currentValue.$1 + widget.childWidth;
      if (newValue >= (widget.width + widget.childWidth)) {
        setState(() {
          _offsets[id] = (
            -widget.childWidth,
            currentValue.$1,
          );
        });
      } else {
        setState(() => _offsets[id] = (newValue, currentValue.$1));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: 16,
      child: Stack(
        children: [
          for (final id in _offsets.keys)
            AnimatedPositioned(
              duration: widget.duration,
              onEnd: () {
                _nextOffset(id);
              },
              left: _offsets[id]?.$1,
              child: Transform.scale(
                scale: 1.02,
                child: Opacity(
                  opacity: (_offsets[id]?.$1 ?? 0) >= (_offsets[id]?.$2 ?? 0)
                      ? 1
                      : 0,
                  child: widget.builder(context),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
