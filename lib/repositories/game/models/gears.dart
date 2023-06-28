import 'dart:ui';

import 'package:pomodoro_adventures/repositories/repositories.dart';

enum GearId {
  // Pickaxes
  bronzePickaxe,
  // Shields
  woodRoundShield,
}

abstract class Gear extends Item {
  const Gear({
    required super.name,
    required super.description,
    required super.icon,
    required this.sprite,
    this.spriteRect = const Rect.fromLTWH(0, 0, 16, 16),
  });

  final String sprite;
  final Rect spriteRect;

  @override
  List<Object?> get props => super.props + [sprite, spriteRect];
}

abstract class Armor extends Gear {
  const Armor({
    required super.name,
    required super.description,
    required super.icon,
    required this.defense,
    required super.sprite,
    super.spriteRect,
  });

  final int defense;

  @override
  List<Object?> get props => super.props + [defense];
}

class HeadArmor extends Armor {
  const HeadArmor({
    required super.name,
    required super.description,
    required super.icon,
    required super.defense,
    required super.sprite,
    super.spriteRect = const Rect.fromLTWH(0, 0, 20, 16),
  });

  @override
  List<Object?> get props => super.props + [defense];
}

class BodyArmor extends Armor {
  const BodyArmor({
    required super.name,
    required super.description,
    required super.icon,
    required super.defense,
    required super.sprite,
    super.spriteRect,
  });

  @override
  List<Object?> get props => super.props + [defense];
}

abstract class HandGear extends Gear {
  const HandGear({
    required super.name,
    required super.description,
    required super.icon,
    required super.sprite,
    super.spriteRect,
  });
}

abstract class Weapon extends HandGear {
  const Weapon({
    required super.name,
    required super.description,
    required super.icon,
    required super.sprite,
    required this.attack,
    super.spriteRect,
  });

  final int attack;

  @override
  List<Object?> get props => super.props + [attack];
}

class Shield extends HandGear {
  const Shield({
    required super.name,
    required super.description,
    required super.icon,
    required super.sprite,
    required this.defense,
    super.spriteRect,
    this.backSpriteRect = const Rect.fromLTWH(16, 0, 16, 16),
  });

  final int defense;

  final Rect backSpriteRect;

  @override
  List<Object?> get props => super.props + [defense, backSpriteRect];
}

class Pickaxe extends Weapon {
  const Pickaxe({
    required super.name,
    required super.description,
    required super.icon,
    required super.attack,
    required super.sprite,
    required this.oresSupported,
    super.spriteRect,
  });

  final List<OreType> oresSupported;

  @override
  List<Object?> get props => super.props + [oresSupported];
}
