import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/game/game.dart';

class GameTopBar extends StatelessWidget {
  const GameTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<GameCubit>().state;
    final stamina =
        '${state.playerState.attributes.stamina.$1}/${state.playerState.attributes.stamina.$2}';

    final cycleProgress = state.currentCycleProgress == null
        ? '-'
        : state.currentCycleProgress!.toStringAsFixed(2);

    return NesContainer(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Stamina: $stamina',
          ),
          Text(
            'Current cycle: $cycleProgress',
          ),
        ],
      ),
    );
  }
}
