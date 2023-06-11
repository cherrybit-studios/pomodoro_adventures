import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/map/map.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  static Route<void> route() {
    return NesHorizontalCloseTransition.route<void>(
      pageBuilder: (_, __, ___) {
        return const MapPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MapView();
  }
}
