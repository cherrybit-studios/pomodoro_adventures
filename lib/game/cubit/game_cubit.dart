import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit({
    required GameRepository repository,
  }) : super(GameState(playerState: repository.current)) {
    _repository = repository;

    _subscription = _repository.playerState.listen((event) {
      emit(GameState(playerState: event));
    });
  }

  late GameRepository _repository;
  late StreamSubscription<PlayerState> _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();

    await super.close();
  }
}
