import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

void main() {
  group('CycleRepository', () {
    test('can be instantiated', () {
      expect(
        CycleRepository(),
        isNotNull,
      );
    });

    test('can create a cycle', () async {
      final cycleRepository = CycleRepository();
      final cycle = cycleRepository.createCycle(1);

      expect(cycle, isNotNull);
      expect(cycleRepository.cycle, equals(cycle));
    });

    test(
      'throws assert error when trying to create a new cycle when there '
      'is already one',
      () async {
        final cycleRepository = CycleRepository()..createCycle(1);

        expect(cycleRepository.cycle, isNotNull);

        expect(() => cycleRepository.createCycle(1), throwsAssertionError);
      },
    );
  });
}
