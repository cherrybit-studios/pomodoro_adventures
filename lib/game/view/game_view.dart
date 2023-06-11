import 'package:flutter/material.dart';
import 'package:pomodoro_adventures/game/game.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: GameScene()),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: GameTopBar(),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: GameSideMenu(),
          )
        ],
      ),
    );
  }
}
