import 'package:pomodoro_adventures/repositories/game/game.dart';

enum LocationId {
  travelling,
  fahsteadTown,
  fahsteadMines,
  fahsteadWoods;

  String get name {
    if (this == LocationId.travelling) {
      return '-';
    } else {
      return map[this]!.name;
    }
  }
}

abstract class Point {
  const Point({
    required this.name,
    required this.description,
    required this.portrait,
  });

  final String name;
  final String description;
  final String portrait;

  String get summary;
}

class Shop extends Point {
  const Shop({
    required super.name,
    required this.gearCatalogs,
    required super.description,
    required super.portrait,
  });

  final List<GearCatalog<dynamic>> gearCatalogs;

  @override
  String get summary =>
      'Sells:\n${gearCatalogs.map((e) => ' - ${e.name}').join('\n')}';
}

enum OreType {
  cooper,
  tin,
  iron,
  coal,
}

class Mine extends Point {
  const Mine({
    required super.name,
    required this.ores,
    required super.description,
    required super.portrait,
  });

  final List<OreType> ores;

  @override
  String get summary => 'Veins:\n${ores.map((e) => ' - ${e.name}').join('\n')}';
}

class Location {
  const Location({
    required this.name,
    required this.x,
    required this.y,
    required this.points,
    required this.background,
  });

  final String name;
  final int x;
  final int y;
  final List<Point> points;
  final String background;
}
