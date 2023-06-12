import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

const _cellSize = 32;

class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    final gridColor =
        (Theme.of(context).textTheme.bodyMedium?.color ?? Colors.black)
            .withOpacity(.2);
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final textTheme = Theme.of(context).textTheme;

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
                  child: NesPressable(
                    onPress: () {},
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
                          entry.value.name,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
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
