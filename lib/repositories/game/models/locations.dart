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
  });

  final String name;

  String get summary;
}

class Shop extends Point {
  const Shop({required super.name});

  // TODO(erickzanardo): Implement shop description.
  @override
  String get summary => 'Shop';
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
