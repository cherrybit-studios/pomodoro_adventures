import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';
import 'package:pomodoro_adventures/scenes/scenes.dart';

class GameScene extends StatelessWidget {
  const GameScene({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameCubit, GameState>(
      buildWhen: (previous, current) =>
          (previous.playerState.currentActivity !=
              current.playerState.currentActivity) ||
          previous.playerState.hasDifferentGear(current.playerState),
      builder: (context, state) {
        final activity = state.playerState.currentActivity;

        if (activity == null) {
          return IdleScene(
            playerState: state.playerState,
          );
        } else if (activity is ShortRest) {
          return const Center(
            child: Text('Short rest'),
          );
        } else if (activity is LongRest) {
          return const Center(
            child: Text('Long rest'),
          );
        } else if (activity is Travel) {
          return TravelScene(
            playerState: state.playerState,
          );
        }

        return const SizedBox();
      },
    );
  }
}
