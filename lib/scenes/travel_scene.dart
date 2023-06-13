import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/extensions/extensions.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';
import 'package:pomodoro_adventures/scenes/scenes.dart';
import 'package:pomodoro_adventures/tilesets/tilesets.dart';
import 'package:pomodoro_adventures/widgets/widgets.dart';

class TravelScene extends StatelessWidget {
  const TravelScene({
    required this.playerState,
    super.key,
  });

  final PlayerState playerState;

  @override
  Widget build(BuildContext context) {
    const tileset = LightWoodTravelArea();

    final destination = (playerState.currentActivity! as Travel).destination;
    final destinationName = map[destination]!.name;

    return Stack(
      children: [
        Positioned.fill(
          child: BaseScene(
            child: Stack(
              children: [
                // Clouds
                Positioned(
                  top: 32,
                  left: 0,
                  child: AutoSlideContainer(
                    width: sceneSize.width,
                    childWidth: sceneSize.width,
                    duration: const Duration(seconds: 20),
                    builder: (_) => SpriteImage(
                      url: tileset.image,
                      src: tileset.bigCloudTile,
                    ),
                  ),
                ),
                Positioned(
                  top: 64,
                  left: 0,
                  child: AutoSlideContainer(
                    width: sceneSize.width,
                    childWidth: sceneSize.width,
                    duration: const Duration(seconds: 40),
                    builder: (_) => SpriteImage(
                      url: tileset.image,
                      src: tileset.smallCloudsTile.random(),
                    ),
                  ),
                ),
                // Fences
                Positioned(
                  bottom: PlayerSprite.spriteSize.height,
                  left: 0,
                  child: AutoSlideContainer(
                    width: sceneSize.width,
                    childWidth: 16,
                    duration: const Duration(milliseconds: 500),
                    builder: (_) => SpriteImage(
                      url: tileset.image,
                      src: tileset.fenceTiles.random(),
                    ),
                  ),
                ),

                // Player
                Positioned(
                  bottom: PlayerSprite.spriteSize.height,
                  left: sceneSize.width / 2 - PlayerSprite.spriteSize.width / 2,
                  child: Bounce(
                    offset: const Offset(0, -.4),
                    child: PlayerSprite(
                      playerState: playerState,
                    ),
                  ),
                ),

                // Ground
                Positioned(
                  left: 0,
                  top: sceneSize.height - 16,
                  child: AutoSlideContainer(
                    width: sceneSize.width,
                    childWidth: 16,
                    duration: const Duration(milliseconds: 500),
                    builder: (_) => SpriteImage(
                      url: tileset.image,
                      src: tileset.groundTile,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 32,
          left: 0,
          right: 0,
          child: Center(
            child: NesContainer(
              child: Text(
                'Travelling to\n\n$destinationName',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
