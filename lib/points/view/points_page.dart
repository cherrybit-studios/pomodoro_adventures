import 'package:flutter/widgets.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/points/points.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

class PointsPage extends StatelessWidget {
  const PointsPage({
    required this.point,
    super.key,
  });

  final Point point;

  static Route<void> route(Point point) {
    return NesHorizontalCloseTransition.route<void>(
      pageBuilder: (_, __, ___) {
        //return BlocProvider(
        //  create: (context) {
        //    final gameRepository = context.read<GameRepository>();
        //    return PointsCubit(gameRepository: gameRepository);
        //  },
        //  child: const PointsPage(),
        //);
        return PointsPage(point: point);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PointsView(point: point);
  }
}
