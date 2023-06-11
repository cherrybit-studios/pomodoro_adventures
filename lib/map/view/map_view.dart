import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

const _cellSize = 32;

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final center = constraints.biggest.center(Offset.zero);
          final textTheme = Theme.of(context).textTheme;

          return Stack(
            children: [
              for (final entry in map.entries)
                Positioned(
                  left: center.dx + entry.value.x * _cellSize,
                  top: center.dy + entry.value.y * _cellSize,
                  child: Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        color: textTheme.bodyMedium?.color ?? Colors.black,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        entry.value.name,
                        textAlign: TextAlign.center,
                      ),
                    ],
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
            ],
          );
        },
      ),
    );
  }
}
