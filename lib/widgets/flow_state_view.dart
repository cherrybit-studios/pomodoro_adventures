import 'package:flutter/material.dart';

typedef FlowStateViewBuilder<T> = Widget Function(
  BuildContext context,
  ValueNotifier<T> state,
);

class FlowStateView<T> extends StatefulWidget {
  const FlowStateView({
    required this.initialState,
    required this.builders,
    super.key,
  });

  final T initialState;
  final Map<T, FlowStateViewBuilder<T>> builders;

  @override
  State<FlowStateView<T>> createState() => _FlowStateViewState<T>();
}

class _FlowStateViewState<T> extends State<FlowStateView<T>> {
  late final ValueNotifier<T> _state = ValueNotifier<T>(
    widget.initialState,
  );

  @override
  void initState() {
    super.initState();

    _state.addListener(() {
      setState(() {});
    });
  }

  late T _current = widget.initialState;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutQuad,
      offset: _current == _state.value ? Offset.zero : const Offset(2, 0),
      onEnd: () {
        if (_current != _state.value) {
          setState(() {
            _current = _state.value;
          });
        }
      },
      child: widget.builders[_current]!(context, _state),
    );
  }
}
