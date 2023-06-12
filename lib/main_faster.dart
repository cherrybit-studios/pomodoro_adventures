import 'package:flutter/material.dart';
import 'package:pomodoro_adventures/app/app.dart';
import 'package:pomodoro_adventures/bootstrap.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final persistenceRepository = PersistenceRepository();
  final cycleRepository = CycleRepository(rate: .01);
  final gameRepository = GameRepository(
    cycleRepository: cycleRepository,
    persistenceRepository: persistenceRepository,
  );

  await gameRepository.load();

  await bootstrap(
    () => App(
      gameRepository: gameRepository,
      cycleRepository: cycleRepository,
    ),
  );
}
