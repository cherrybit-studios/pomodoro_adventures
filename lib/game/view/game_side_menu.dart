import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/l10n/l10n.dart';
import 'package:pomodoro_adventures/map/map.dart';
import 'package:pomodoro_adventures/repositories/game/models/map.dart';
import 'package:pomodoro_adventures/widgets/widgets.dart';

enum GameSideMenuState {
  home,
  places,
}

class GameSideMenu extends StatelessWidget {
  const GameSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return FlowStateView<GameSideMenuState>(
      initialState: GameSideMenuState.home,
      builders: {
        GameSideMenuState.home: (context, state) {
          return _HomeMenu(
            onPlacesPressed: () {
              state.value = GameSideMenuState.places;
            },
          );
        },
        GameSideMenuState.places: (context, state) {
          return _PlacesMenu(
            onBack: () {
              state.value = GameSideMenuState.home;
            },
          );
        },
      },
    );
  }
}

class _HomeMenu extends StatelessWidget {
  const _HomeMenu({
    required this.onPlacesPressed,
  });

  final VoidCallback onPlacesPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return NesContainer(
      child: Column(
        children: [
          NesButton(
            type: NesButtonType.normal,
            onPressed: onPlacesPressed,
            child: Text(l10n.places),
          ),
          const SizedBox(height: 9),
          NesButton(
            type: NesButtonType.normal,
            onPressed: () {
              Navigator.of(context).push(
                MapPage.route(),
              );
            },
            child: Text(l10n.travel),
          ),
        ],
      ),
    );
  }
}

class _PlacesMenu extends StatelessWidget {
  const _PlacesMenu({
    required this.onBack,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final currentLocationId =
        context.select((GameCubit cubit) => cubit.state.playerState.location);
    final location = map[currentLocationId]!;

    return NesContainer(
      child: Column(
        children: [
          for (final point in location.points) ...[
            NesButton(
              type: NesButtonType.normal,
              onPressed: onBack,
              child: SizedBox(
                width: 200,
                child: Text(point.name),
              ),
            ),
            const SizedBox(height: 8),
          ],
          NesButton(
            type: NesButtonType.warning,
            onPressed: onBack,
            child: SizedBox(
              width: 200,
              child: Text(l10n.back),
            ),
          ),
        ],
      ),
    );
  }
}
