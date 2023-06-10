import 'dart:ui';

class CycleRepository {
  const CycleRepository({
    double rate = 1,
  }) : _rate = rate;

  final double _rate;

  void runShortRest(VoidCallback callback) {
    Future<void>.delayed(Duration(minutes: (5 * _rate).round()))
        .then((value) => callback());
  }

  void runLongerRest(VoidCallback callback) {
    Future<void>.delayed(Duration(minutes: (15 * _rate).round()))
        .then((value) => callback());
  }

  void runWorkCycle(VoidCallback callback) {
    Future<void>.delayed(Duration(minutes: (25 * _rate).round()))
        .then((value) => callback());
  }
}
