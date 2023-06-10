import 'package:pomodoro_adventures/app/app.dart';
import 'package:pomodoro_adventures/bootstrap.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

void main() {
  final persistenceRepository = PersistenceRepository();
  const cycleRepository = CycleRepository();
  final gameRepository = GameRepository(
    cycleRepository: cycleRepository,
    persistenceRepository: persistenceRepository,
  );
  bootstrap(
    () => App(gameRepository: gameRepository),
  );
}
