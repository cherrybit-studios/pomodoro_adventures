import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/map/map.dart';

class GameSideMenu extends StatelessWidget {
  const GameSideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return NesContainer(
      child: Column(
        children: [
          NesButton(
            type: NesButtonType.normal,
            onPressed: () {
              Navigator.of(context).push(
                MapPage.route(),
              );
            },
            child: const Text('Map'),
          ),
        ],
      ),
    );
  }
}
