// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

void main() {
  group('PlayerState', () {
    test("applyStamina can't go bellow zero", () {
      final playerState = PlayerState(
        attributes: PlayerAttributes(
          stamina: (2, 10),
        ),
        location: LocationId.fahsteadTown,
      );

      final newState = playerState.applyStamina(-10);
      expect(newState.attributes.stamina.$1, equals(0));
    });

    test("applyStamina can't go above max", () {
      final playerState = PlayerState(
        attributes: PlayerAttributes(
          stamina: (2, 10),
        ),
        location: LocationId.fahsteadTown,
      );

      final newState = playerState.applyStamina(10);
      expect(newState.attributes.stamina.$1, equals(10));
    });
  });
}
