import 'dart:math';

final _rng = Random();

extension PomodoroAdventuresListX<T> on List<T> {
  T random() => this[_rng.nextInt(length)];
}
