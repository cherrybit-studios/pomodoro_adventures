import 'package:equatable/equatable.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

abstract class ConsumableEffect extends Equatable {
  const ConsumableEffect();

  PlayerState apply(PlayerState playerState);
}

class HealingEffect extends ConsumableEffect {
  const HealingEffect({
    required this.health,
  });

  final int health;

  @override
  PlayerState apply(PlayerState playerState) {
    return playerState.applyHealth(health);
  }

  @override
  List<Object?> get props => [health];
}

class StaminaEffect extends ConsumableEffect {
  const StaminaEffect({
    required this.stamina,
  });

  final int stamina;

  @override
  PlayerState apply(PlayerState playerState) {
    return playerState.applyStamina(stamina);
  }

  @override
  List<Object?> get props => [stamina];
}

class ConsumableItem extends Item {
  const ConsumableItem({
    required super.name,
    required super.description,
    required super.icon,
    required this.effect,
  });

  final ConsumableEffect effect;

  @override
  List<Object?> get props => super.props + [effect];
}
