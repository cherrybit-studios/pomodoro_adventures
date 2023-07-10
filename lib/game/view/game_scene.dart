import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';
import 'package:pomodoro_adventures/scenes/scenes.dart';

class GameScene extends StatefulWidget {
  const GameScene({super.key});

  @override
  State<GameScene> createState() => _GameSceneState();
}

class _GameSceneState extends State<GameScene>
    with SingleTickerProviderStateMixin {
  Activity? _currentActivity;
  Activity? _nextActivity;

  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 1000,
    ),
  );

  @override
  void initState() {
    super.initState();

    _currentActivity =
        context.read<GameCubit>().state.playerState.currentActivity;

    _animationController
      ..addListener(() {
        setState(() {
          if (_animationController.value >= 0.5 &&
              _nextActivity != _currentActivity) {
            _currentActivity = _nextActivity;
          }
        });
      })
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameCubit, GameState>(
      listenWhen: (previous, current) =>
          previous.playerState.currentActivity !=
          current.playerState.currentActivity,
      listener: (context, state) {
        setState(() {
          _nextActivity = state.playerState.currentActivity;
        });

        _animationController
          ..reset()
          ..forward();
      },
      child: NesHorizontalGridTransition(
        animation: _animationController,
        child: _ActivityScene(activity: _currentActivity),
      ),
    );
  }
}

class _ActivityScene extends StatelessWidget {
  const _ActivityScene({required this.activity});

  final Activity? activity;

  @override
  Widget build(BuildContext context) {
    final state = context.select((GameCubit cubit) => cubit.state);
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
  }
}
