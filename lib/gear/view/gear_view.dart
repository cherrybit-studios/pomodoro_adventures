import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/l10n/l10n.dart';
import 'package:pomodoro_adventures/scenes/scenes.dart';

class GearView extends StatelessWidget {
  const GearView({
    required this.onBack,
    super.key,
  });

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final playerState = context.select(
      (GameCubit cubit) => cubit.state.playerState,
    );

    return NesContainer(
      width: 480,
      child: Column(
        children: [
          Text(
            l10n.gear,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(l10n.preview),
              Text(l10n.equipped),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: NesContainer(
                  height: 200,
                  child: PlayerSprite(
                    playerState: playerState,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: NesContainer(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NesTooltip(
                            message: l10n.leftHandGear,
                            child: NesIcon(
                              iconData: NesIcons.instance.leftHand,
                            ),
                          ),
                          Text(playerState.leftHand?.name ?? '-'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NesTooltip(
                            message: l10n.rightHandGear,
                            child: NesIcon(
                              iconData: NesIcons.instance.rightHand,
                            ),
                          ),
                          Text(playerState.rightHand?.name ?? '-'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NesTooltip(
                            message: l10n.headGear,
                            child: NesIcon(
                              iconData: NesIcons.instance.helm,
                            ),
                          ),
                          Text(playerState.head?.name ?? '-'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NesTooltip(
                            message: l10n.armor,
                            child: NesIcon(
                              iconData: NesIcons.instance.upperArmor,
                            ),
                          ),
                          Text(playerState.body?.name ?? '-'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          NesButton(
            type: NesButtonType.warning,
            onPressed: onBack,
            child: Text(l10n.back),
          ),
        ],
      ),
    );
  }
}
