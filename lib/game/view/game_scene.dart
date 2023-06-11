import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

class GameScene extends StatelessWidget {
  const GameScene({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<GameCubit>();

    final state = cubit.state;

    final activity = state.playerState.currentActivity;

    if (activity == null) {
      return const Center(
        child: Text('Idle'),
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
      return const Center(
        child: Text('Travel'),
      );
    }

    return const SizedBox();
  }
}
