import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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
        theme: flutterNesTheme(
          nesIconTheme: const NesIconTheme(
            primary: Color(0xFF794100),
            secondary: Color(0xFFffa200),
          ),
          nesContainerTheme: NesContainerTheme(
            backgroundColor: const Color(0xFFffdba2),
            borderColor: const Color(0xffc37100),
            labelTextStyle: GoogleFonts.pressStart2p(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ).copyWith(
          scaffoldBackgroundColor: const Color(0xFF305182),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const GamePage(),
      ),
    );
  }
}
