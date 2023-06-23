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
  });

  final String sprite;

  @override
  List<Object?> get props => super.props + [sprite];
}

abstract class Armor extends Gear {
  const Armor({
    required super.name,
    required super.description,
    required super.icon,
    required this.defense,
    required super.sprite,
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
  });
}

abstract class Weapon extends HandGear {
  const Weapon({
    required super.name,
    required super.description,
    required super.icon,
    required super.sprite,
    required this.attack,
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
  });

  final int defense;

  @override
  List<Object?> get props => super.props + [defense];
}

class Pickaxe extends Weapon {
  const Pickaxe({
    required super.name,
    required super.description,
    required super.icon,
    required super.attack,
    required super.sprite,
    required this.oresSupported,
  });

  final List<OreType> oresSupported;

  @override
  List<Object?> get props => super.props + [oresSupported];
}
