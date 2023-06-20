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
    required this.currentActivity,
    required this.leftHand,
    required this.rightHand,
    required this.head,
    required this.body,
  });

  final PlayerAttributes attributes;
  final LocationId location;
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

  PlayerState copyWith({
    PlayerAttributes? attributes,
    LocationId? location,
    NullableValue<Activity>? currentActivity,
    NullableValue<HandGear>? leftHand,
    NullableValue<HandGear>? rightHand,
    NullableValue<HeadArmor>? head,
    NullableValue<BodyArmor>? body,
  }) {
    return PlayerState(
      attributes: attributes ?? this.attributes,
      location: location ?? this.location,
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
        currentActivity,
        leftHand,
        rightHand,
        head,
        body,
      ];
}
