import 'package:flutter/material.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

class PlayerSprite extends StatelessWidget {
  const PlayerSprite({
    required this.playerState,
    super.key,
  });

  final PlayerState playerState;

  static const spriteSize = Size(16, 16);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/sprites/pomodoro_base.png',
      width: spriteSize.width,
      height: spriteSize.height,
      filterQuality: FilterQuality.none,
    );
  }
}
