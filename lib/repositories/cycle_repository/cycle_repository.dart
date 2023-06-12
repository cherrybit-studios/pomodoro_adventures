import 'dart:async';

import 'package:equatable/equatable.dart';

abstract class CycleEvent extends Equatable {}

class CycleProgressEvent extends CycleEvent {
  CycleProgressEvent(this.percentage);

  final double percentage;

  @override
  List<Object> get props => [percentage];
}

class CycleCompletedEvent extends CycleEvent {
  @override
  List<Object> get props => [];
}

class Cycle {
  Cycle({
    required this.totalSeconds,
    double rate = 1,
  }) : _rate = rate;

  final int totalSeconds;
  int currentSeconds = -1;
  final double _rate;

  final StreamController<CycleEvent> _controller =
      StreamController<CycleEvent>.broadcast();
  Stream<CycleEvent> get events => _controller.stream;

  bool get completed => currentSeconds >= totalSeconds;

  void start() {
    if (currentSeconds == -1) {
      _tick();
    }
  }

  void _tick() {
    currentSeconds += 1;

    if (completed) {
      _controller.add(CycleCompletedEvent());
    } else {
      _controller.add(CycleProgressEvent(currentSeconds / totalSeconds));
      Future<void>.delayed(
        Duration(
          milliseconds: (1000 * _rate).round(),
        ),
      ).then((value) => _tick());
    }
  }

  void dispose() {
    _controller.close();
  }
}

class CycleRepository {
  CycleRepository({
    double rate = 1,
  }) : _rate = rate;

  final double _rate;

  Cycle? _cycle;
  Cycle? get cycle => _cycle;

  final _controller = StreamController<Cycle>.broadcast();
  Stream<Cycle> get cycles => _controller.stream;

  Cycle createCycle(int minutes) {
    assert(_cycle == null, 'There is already a running cycle');
    _cycle = Cycle(
      totalSeconds: 5 * 60,
      rate: _rate,
    );

    late final StreamSubscription<CycleEvent> subscription;
    subscription = _cycle!.events.listen((event) {
      if (event is CycleCompletedEvent) {
        _cycle!.dispose();
        _cycle = null;
        subscription.cancel();
      }
    });

    _controller.add(_cycle!);

    return _cycle!;
  }
}
