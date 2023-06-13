import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/map/map.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';
import 'package:pomodoro_adventures/widgets/widgets.dart';

const _cellSize = 32;

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final playerState = context.read<GameRepository>().current;
    final gridColor =
        (Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black)
            .withOpacity(.2);

    final mapState = context.watch<MapCubit>().state;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const totalSize = Size(
            _cellSize * 20,
            _cellSize * 20,
          );

          final center = Offset(
            constraints.maxWidth / 2 - totalSize.width / 2,
            constraints.maxHeight / 2 - totalSize.height / 2,
          );

          return Stack(
            children: [
              for (var y = 0; y < totalSize.height; y += _cellSize)
                for (var x = 0; x < totalSize.width; x += _cellSize)
                  Positioned(
                    left: center.dx + x.toDouble(),
                    top: center.dy + y.toDouble(),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: gridColor,
                        ),
                      ),
                      child: SizedBox(
                        width: _cellSize.toDouble(),
                        height: _cellSize.toDouble(),
                      ),
                    ),
                  ),
              for (final entry in map.entries)
                Positioned(
                  left: center.dx + entry.value.x * _cellSize,
                  top: center.dy + entry.value.y * _cellSize,
                  child: _MapMarker(
                    entry: entry,
                    playerState: playerState,
                  ),
                ),
              Positioned(
                left: 16,
                top: 16,
                child: NesButton(
                  type: NesButtonType.normal,
                  child: NesIcon(
                    iconData: NesIcons.instance.leftArrowIndicator,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              if (mapState.selected != null)
                Positioned(
                  top: 16,
                  right: 16,
                  child: LocationPanel(
                    locationId: mapState.selected!,
                    location: map[mapState.selected!]!,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  const _MapMarker({
    required this.entry,
    required this.playerState,
  });

  final MapEntry<LocationId, Location> entry;
  final PlayerState playerState;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final mapCubit = context.watch<MapCubit>();

    final isCurrentLocation = playerState.location == entry.key;
    final isSelected = mapCubit.state.selected == entry.key;

    final child = NesPressable(
      onPress: () async {
        if (isSelected) {
          context.read<MapCubit>().select(null);
        } else {
          context.read<MapCubit>().select(entry.key);
        }
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            color: textTheme.bodyMedium?.color ?? Colors.black,
          ),
          const SizedBox(width: 8),
          Text(
            entry.value.name + (isCurrentLocation ? ' (You are here)' : ''),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    return isSelected ? Blink(child: child) : child;
  }
}
