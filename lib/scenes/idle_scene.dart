import 'package:flutter/material.dart';
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
    return BaseScene(
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: sceneSize.width / 2 - PlayerSprite.spriteSize.width / 2,
            child: PlayerSprite(
              playerState: playerState,
            ),
          ),
        ],
      ),
    );
  }
}
