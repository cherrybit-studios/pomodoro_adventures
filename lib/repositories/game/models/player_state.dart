import 'dart:math' as math;
import 'package:equatable/equatable.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

class NullableValue<T> {
  const NullableValue(this.value);

  final T? value;
}

class PlayerAttributes extends Equatable {
  const PlayerAttributes({
    required this.stamina,
    required this.health,
  });

  final (int, int) stamina;
  final (int, int) health;

  PlayerAttributes copyWith({
    (int, int)? stamina,
    (int, int)? health,
  }) {
    return PlayerAttributes(
      stamina: stamina ?? this.stamina,
      health: health ?? this.health,
    );
  }

  @override
  List<Object> get props => [stamina];
}

class PlayerState extends Equatable {
  const PlayerState({
    required this.attributes,
    required this.location,
    required this.inventory,
    required this.currentActivity,
    required this.leftHand,
    required this.rightHand,
    required this.head,
    required this.body,
  });

  final PlayerAttributes attributes;
  final LocationId location;
  final List<Item> inventory;
  final Activity? currentActivity;
  final HandGear? leftHand;
  final HandGear? rightHand;
  final HeadArmor? head;
  final BodyArmor? body;

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

  PlayerState applyHealth(int health) {
    final newHealth = math.max(
      0,
      math.min(
        attributes.health.$1 + health,
        attributes.health.$2,
      ),
    );

    return copyWith(
      attributes: attributes.copyWith(
        health: (newHealth, attributes.health.$2),
      ),
    );
  }

  PlayerState copyWith({
    PlayerAttributes? attributes,
    LocationId? location,
    List<Item>? inventory,
    NullableValue<Activity>? currentActivity,
    NullableValue<HandGear>? leftHand,
    NullableValue<HandGear>? rightHand,
    NullableValue<HeadArmor>? head,
    NullableValue<BodyArmor>? body,
  }) {
    return PlayerState(
      attributes: attributes ?? this.attributes,
      location: location ?? this.location,
      inventory: inventory ?? this.inventory,
      currentActivity: currentActivity == null
          ? this.currentActivity
          : currentActivity.value,
      leftHand: leftHand == null ? this.leftHand : leftHand.value,
      rightHand: rightHand == null ? this.rightHand : rightHand.value,
      head: head == null ? this.head : head.value,
      body: body == null ? this.body : body.value,
    );
  }

  @override
  List<Object?> get props => [
        attributes,
        location,
        inventory,
        currentActivity,
        leftHand,
        rightHand,
        head,
        body,
      ];
}
