import 'dart:ui';

abstract class TravelAreaTileset {
  const TravelAreaTileset();
  Rect get groundTile;
  List<Rect> get fenceTiles;
  Rect get bigCloudTile;
  List<Rect> get smallCloudsTile;
  String get image;
}

class LightWoodTravelArea extends TravelAreaTileset {
  const LightWoodTravelArea();
  @override
  List<Rect> get fenceTiles => const [
        Rect.fromLTWH(0, 16, 16, 16),
        Rect.fromLTWH(16, 16, 16, 16),
        Rect.fromLTWH(32, 16, 16, 16),
      ];

  @override
  Rect get groundTile => const Rect.fromLTWH(0, 0, 16, 16);

  @override
  Rect get bigCloudTile => const Rect.fromLTWH(0, 32, 48, 48);

  @override
  List<Rect> get smallCloudsTile => const [
        Rect.fromLTWH(0, 48, 16, 16),
        Rect.fromLTWH(16, 48, 16, 16),
        Rect.fromLTWH(32, 48, 16, 16),
      ];

  @override
  String get image => 'assets/tilesets/lightwood.png';
}
