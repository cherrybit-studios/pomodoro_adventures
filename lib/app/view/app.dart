import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/game/game.dart';
import 'package:pomodoro_adventures/l10n/l10n.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';

class App extends StatelessWidget {
  const App({
    required this.gameRepository,
    required this.cycleRepository,
    super.key,
  });

  final GameRepository gameRepository;
  final CycleRepository cycleRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: gameRepository),
        RepositoryProvider.value(value: cycleRepository),
      ],
      child: MaterialApp(
        theme: flutterNesTheme(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const GamePage(),
      ),
    );
  }
}
