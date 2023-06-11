import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final gameRepository = context.read<GameRepository>();
        return GameCubit(repository: gameRepository);
      },
      child: const GameView(),
    );
  }
}
