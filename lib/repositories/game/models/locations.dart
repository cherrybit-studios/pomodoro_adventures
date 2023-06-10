enum LocationId {
  travelling,
  fahsteadTown,
  fahsteadMines,
  fahsteadWoods,
}

abstract class Point {
  const Point({
    required this.name,
  });

  final String name;
}

class Shop extends Point {
  const Shop({required super.name});
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
}

class Location {
  const Location({
    required this.name,
    required this.x,
    required this.y,
    required this.points,
  });

  final String name;
  final int x;
  final int y;
  final List<Point> points;
}
