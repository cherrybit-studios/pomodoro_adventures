import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/map/map.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  static Route<void> route() {
    return NesHorizontalCloseTransition.route<void>(
      pageBuilder: (_, __, ___) {
        return BlocProvider(
          create: (context) {
            final gameRepository = context.read<GameRepository>();
            return MapCubit(gameRepository: gameRepository);
          },
          child: const MapPage(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const MapView();
  }
}
