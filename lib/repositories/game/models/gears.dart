import 'package:equatable/equatable.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

enum GearId {
  bronzePickaxe,
}

abstract class Gear extends Equatable {
  const Gear({
    required this.name,
    required this.description,
    required this.icon,
  });

  final String name;
  final String description;
  final String icon;

  @override
  List<Object?> get props => [name, description, icon];
}

abstract class Armor extends Gear {
  const Armor({
    required super.name,
    required super.description,
    required super.icon,
    required this.defense,
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
  });

  @override
  List<Object?> get props => super.props + [defense];
}

abstract class HandGear extends Gear {
  const HandGear({
    required super.name,
    required super.description,
    required super.icon,
  });
}

abstract class Weapon extends HandGear {
  const Weapon({
    required super.name,
    required super.description,
    required super.icon,
    required this.attack,
  });

  final int attack;

  @override
  List<Object?> get props => super.props + [attack];
}

abstract class Shield extends HandGear {
  const Shield({
    required super.name,
    required super.description,
    required super.icon,
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
    required this.oresSupported,
  });

  final List<OreType> oresSupported;

  @override
  List<Object?> get props => super.props + [oresSupported];
}
