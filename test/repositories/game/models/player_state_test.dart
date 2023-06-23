// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

void main() {
  group('PlayerState', () {
    test("applyStamina can't go bellow zero", () {
      final playerState = PlayerState(
        attributes: PlayerAttributes(
          stamina: (2, 10),
          health: (10, 10),
        ),
        location: LocationId.fahsteadTown,
        inventory: const [],
        currentActivity: null,
        leftHand: null,
        rightHand: null,
        head: null,
        body: null,
      );

      final newState = playerState.applyStamina(-10);
      expect(newState.attributes.stamina.$1, equals(0));
    });

    test("applyStamina can't go above max", () {
      final playerState = PlayerState(
        attributes: PlayerAttributes(
          stamina: (2, 10),
          health: (10, 10),
        ),
        location: LocationId.fahsteadTown,
        inventory: const [],
        currentActivity: null,
        leftHand: null,
        rightHand: null,
        head: null,
        body: null,
      );

      final newState = playerState.applyStamina(10);
      expect(newState.attributes.stamina.$1, equals(10));
    });
  });
}
