import 'package:flutter/material.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';
import 'package:pomodoro_adventures/widgets/widgets.dart';

class PlayerSprite extends StatelessWidget {
  const PlayerSprite({
    required this.playerState,
    super.key,
  });

  final PlayerState playerState;

  static const spriteSize = Size(16, 16);

  @override
  Widget build(BuildContext context) {
    final size = Size(
      spriteSize.width * 1.4,
      spriteSize.height * 1.2,
    );
    return Align(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            if (playerState.leftHand != null)
              Positioned(
                bottom: 16,
                left: -4,
                child: SpriteImage(
                  url: playerState.leftHand!.sprite,
                  src: playerState.leftHand!.leftHandRect,
                ),
              ),
            Positioned(
              bottom: 0,
              right: 4,
              child: Image.asset(
                'assets/sprites/pomodoro_base.png',
                width: spriteSize.width,
                height: spriteSize.height,
                filterQuality: FilterQuality.none,
              ),
            ),
            if (playerState.head != null)
              Positioned(
                left: .8,
                top: -1.8,
                child: SpriteImage(
                  url: playerState.head!.sprite,
                  src: playerState.head!.spriteRect,
                ),
              ),
            if (playerState.rightHand != null)
              Positioned(
                bottom: 16,
                left: 10,
                child: SpriteImage(
                  url: playerState.rightHand!.sprite,
                  src: playerState.rightHand!.spriteRect,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

extension on HandGear {
  Rect get leftHandRect {
    if (this is Shield) {
      return (this as Shield).backSpriteRect;
    } else {
      return spriteRect;
    }
  }
}
