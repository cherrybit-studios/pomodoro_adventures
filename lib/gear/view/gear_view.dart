import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/gear/view/view.dart';
import 'package:pomodoro_adventures/l10n/l10n.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';
import 'package:pomodoro_adventures/scenes/scenes.dart';

class GearView extends StatefulWidget {
  const GearView({
    required this.onBack,
    super.key,
  });

  final VoidCallback onBack;

  @override
  State<GearView> createState() => _GearViewState();
}

class _GearViewState extends State<GearView> {
  Type? _selectedGearType;
  late GearSlot _gearSlot;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    final playerState = context.select(
      (GameCubit cubit) => cubit.state.playerState,
    );

    return NesContainer(
      width: 480,
      height: 480,
      child: Stack(
        children: [
          Positioned.fill(
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
                      flex: 4,
                      child: ClipRect(
                        child: NesContainer(
                          height: 200,
                          child: Transform.scale(
                            scale: 6,
                            child: PlayerSprite(
                              playerState: playerState,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 6,
                      child: NesContainer(
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NesPressable(
                              onPress: () {
                                setState(() {
                                  _selectedGearType = HandGear;
                                  _gearSlot = GearSlot.leftHand;
                                });
                              },
                              child: Row(
                                children: [
                                  NesTooltip(
                                    message: l10n.leftHandGear,
                                    child: NesIcon(
                                      iconData: NesIcons.instance.leftHand,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _GearEntry(gear: playerState.leftHand),
                                ],
                              ),
                            ),
                            NesPressable(
                              onPress: () {
                                setState(() {
                                  _selectedGearType = HandGear;
                                  _gearSlot = GearSlot.rightHand;
                                });
                              },
                              child: Row(
                                children: [
                                  NesTooltip(
                                    message: l10n.rightHandGear,
                                    child: NesIcon(
                                      iconData: NesIcons.instance.rightHand,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _GearEntry(gear: playerState.rightHand),
                                ],
                              ),
                            ),
                            NesPressable(
                              onPress: () {
                                setState(() {
                                  _selectedGearType = HeadArmor;
                                  _gearSlot = GearSlot.head;
                                });
                              },
                              child: Row(
                                children: [
                                  NesTooltip(
                                    message: l10n.headGear,
                                    child: NesIcon(
                                      iconData: NesIcons.instance.helm,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _GearEntry(gear: playerState.head),
                                ],
                              ),
                            ),
                            NesPressable(
                              onPress: () {
                                setState(() {
                                  _selectedGearType = BodyArmor;
                                  _gearSlot = GearSlot.body;
                                });
                              },
                              child: Row(
                                children: [
                                  NesTooltip(
                                    message: l10n.armor,
                                    child: NesIcon(
                                      iconData: NesIcons.instance.upperArmor,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  _GearEntry(gear: playerState.body),
                                ],
                              ),
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
                  onPressed: widget.onBack,
                  child: Text(l10n.back),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: _selectedGearType == null ? 0 : 1,
              child: _selectedGearType != null
                  ? GearChangeView(
                      selected: playerState.gearFromSlot(_gearSlot),
                      gearType: _selectedGearType!,
                      fullSelection: playerState.equippedGear,
                      onCancel: () {
                        setState(() {
                          _selectedGearType = null;
                        });
                      },
                      onSelected: (gear) {
                        setState(() {
                          _selectedGearType = null;
                        });
                        context.read<GameRepository>().equipGear(
                              gear: gear,
                              slot: _gearSlot,
                            );
                      },
                    )
                  : const NesContainer(
                      width: double.infinity,
                      height: double.infinity,
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GearEntry extends StatelessWidget {
  const _GearEntry({
    required this.gear,
  });

  final Gear? gear;

  @override
  Widget build(BuildContext context) {
    if (gear == null) {
      return const Text('-');
    } else {
      return SizedBox(
        width: 136,
        height: 34,
        child: Row(
          children: [
            NesIcon(
              iconData: NesIconData(
                MiniSprite.fromDataString(gear!.icon),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: NesTooltip(
                message: gear!.name,
                child: Text(
                  gear!.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
