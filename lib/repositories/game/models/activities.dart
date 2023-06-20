import 'package:equatable/equatable.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

enum CycleType {
  short,
  medium,
  long,
}

abstract class Activity extends Equatable {
  const Activity({
    required this.staminaCost,
    required this.type,
  });

  final int staminaCost;
  final CycleType type;

  PlayerState onStart(PlayerState playerState);
  PlayerState onCompleteCycle(PlayerState playerState);

  @override
  List<Object> get props => [staminaCost, type];
}

class ShortRest extends Activity {
  const ShortRest()
      : super(
          staminaCost: 0,
          type: CycleType.short,
        );

  @override
  PlayerState onCompleteCycle(PlayerState playerState) {
    return playerState.applyStamina(2);
  }

  @override
  PlayerState onStart(PlayerState playerState) {
    return playerState;
  }
}

class LongRest extends Activity {
  const LongRest()
      : super(
          staminaCost: 0,
          type: CycleType.medium,
        );

  @override
  PlayerState onCompleteCycle(PlayerState playerState) {
    return playerState.applyStamina(6);
  }

  @override
  PlayerState onStart(PlayerState playerState) {
    return playerState;
  }
}

class Travel extends Activity {
  const Travel({
    required this.destination,
    required this.travelCycles,
  }) : super(
          staminaCost: 2,
          type: CycleType.long,
        );

  final LocationId destination;
  final int travelCycles;

  @override
  PlayerState onCompleteCycle(PlayerState playerState) {
    if (travelCycles == 1) {
      return playerState.copyWith(
        location: destination,
        currentActivity: const NullableValue(null),
      );
    } else {
      return playerState.copyWith(
        location: LocationId.travelling,
      );
    }
  }

  @override
  PlayerState onStart(PlayerState playerState) {
    return playerState.copyWith(
      location: LocationId.travelling,
    );
  }

  Travel copyWith({
    LocationId? destination,
    int? travelCycles,
  }) {
    return Travel(
      destination: destination ?? this.destination,
      travelCycles: travelCycles ?? this.travelCycles,
    );
  }
}
