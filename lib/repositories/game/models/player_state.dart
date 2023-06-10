import 'dart:math' as math;
import 'package:equatable/equatable.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

class PlayerAttributes extends Equatable {
  const PlayerAttributes({
    required this.stamina,
  });

  final (int, int) stamina;

  PlayerAttributes copyWith({
    (int, int)? stamina,
  }) {
    return PlayerAttributes(
      stamina: stamina ?? this.stamina,
    );
  }

  @override
  List<Object> get props => [stamina];
}

class PlayerState extends Equatable {
  const PlayerState({
    required this.attributes,
    required this.location,
    this.currentActivity,
  });

  final PlayerAttributes attributes;
  final LocationId location;
  final Activity? currentActivity;

  PlayerState applyStamina(int stamina) {
    final newStamina = math.max(
      0,
      math.min(
        attributes.stamina.$1 + stamina,
        attributes.stamina.$2,
      ),
    );

    return copyWith(
      attributes: attributes.copyWith(
        stamina: (newStamina, attributes.stamina.$2),
      ),
    );
  }

  PlayerState idle({
    PlayerAttributes? attributes,
    LocationId? location,
  }) {
    return PlayerState(
      attributes: attributes ?? this.attributes,
      location: location ?? this.location,
    );
  }

  PlayerState copyWith({
    PlayerAttributes? attributes,
    LocationId? location,
    Activity? currentActivity,
  }) {
    return PlayerState(
      attributes: attributes ?? this.attributes,
      location: location ?? this.location,
      currentActivity: currentActivity ?? this.currentActivity,
    );
  }

  @override
  List<Object> get props => [attributes, location];
}
