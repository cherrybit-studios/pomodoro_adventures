import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_sprite/mini_sprite.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/l10n/l10n.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

class GearChangeView extends StatefulWidget {
  const GearChangeView({
    required this.onSelected,
    required this.onCancel,
    required this.gearType,
    this.selected,
    super.key,
  });

  final Gear? selected;
  final void Function(Gear? selected) onSelected;
  final VoidCallback onCancel;
  final Type gearType;

  @override
  State<GearChangeView> createState() => _GearChangeViewState();
}

class _GearChangeViewState extends State<GearChangeView> {
  late final Gear? _currentSelected = widget.selected;
  Gear? _selected;
  late List<Gear> _gears;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _gears = context
        .read<GameRepository>()
        .current
        .inventory
        .where((gear) {
          if (widget.gearType == Armor) {
            return gear is Armor;
          } else if (widget.gearType == HandGear) {
            return gear is HandGear;
          }

          return false;
        })
        .cast<Gear>()
        .where((gear) => gear != _selected)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return NesContainer(
      child: Column(
        children: [
          Text(
            l10n.currentEquippedGear,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(),
          SizedBox(
            height: 32,
            child: _currentSelected != null
                ? _GearLabel(gear: _currentSelected!)
                : const Text(' - '),
          ),
          const SizedBox(height: 8),
          NesIcon(
            iconData: NesIcons.instance.exchange,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 32,
            child: _selected != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _GearLabel(gear: _selected!),
                      const SizedBox(width: 4),
                      NesIconButton(
                        icon: NesIcons.instance.close,
                        onPress: () {
                          setState(() {
                            _selected = null;
                          });
                        },
                      ),
                    ],
                  )
                : const Text(' - '),
          ),
          const SizedBox(height: 16),
          Text(
            l10n.availableGears,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(),
          Expanded(
            child: NesSingleChildScrollView(
              child: Column(
                children: [
                  for (final gear in _gears)
                    NesPressable(
                      onPress: () {
                        setState(() {
                          _selected = gear;
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _GearLabel(gear: gear),
                          const SizedBox(height: 8),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NesButton(
                type: NesButtonType.warning,
                onPressed: widget.onCancel,
                child: Text(l10n.cancel),
              ),
              const SizedBox(width: 8),
              NesButton(
                type: NesButtonType.primary,
                onPressed: () {
                  widget.onSelected(_selected);
                },
                child: Text(l10n.confirm),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GearLabel extends StatelessWidget {
  const _GearLabel({
    required this.gear,
  });

  final Gear gear;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NesIcon(
          iconData: NesIconData(
            MiniSprite.fromDataString(gear.icon),
          ),
        ),
        const SizedBox(width: 16),
        Text(gear.name),
      ],
    );
  }
}

extension on Gear {
  int get value {
    if (this is Armor) {
      return (this as Armor).defense;
    } else if (this is Shield) {
      return (this as Shield).defense;
    } else if (this is Weapon) {
      return (this as Weapon).attack;
    }
    return 0;
  }
}
