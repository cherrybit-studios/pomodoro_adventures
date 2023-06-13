import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';
import 'package:pomodoro_adventures/scenes/scenes.dart';

class IdleScene extends StatelessWidget {
  const IdleScene({
    required this.playerState,
    super.key,
  });

  final PlayerState playerState;

  @override
  Widget build(BuildContext context) {
    final destination = playerState.location;

    return Stack(
      children: [
        Positioned.fill(
          child: BaseScene(
            child: Stack(
              children: [
                if (destination != LocationId.travelling)
                  Positioned.fill(
                    child: Image.asset(
                      map[destination]!.background,
                      filterQuality: FilterQuality.none,
                    ),
                  ),

                // Player
                Positioned(
                  bottom: PlayerSprite.spriteSize.height,
                  left: sceneSize.width / 2 - PlayerSprite.spriteSize.width / 2,
                  child: PlayerSprite(
                    playerState: playerState,
                  ),
                ),

                // Ground
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
                'At:\n\n${destination.name}',
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
