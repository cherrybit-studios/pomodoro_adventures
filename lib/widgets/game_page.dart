import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: child),
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
  }
}
