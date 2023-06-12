import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pomodoro_adventures/repositories/cycle_repository/cycle_repository.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit({
    required GameRepository repository,
    required CycleRepository cycleRepository,
  }) : super(GameState(playerState: repository.current)) {
    _repository = repository;

    _cycleRepository = cycleRepository;

    _subscription = _repository.playerState.listen((event) {
      emit(GameState(playerState: event));
    });

    _cycleSubscription = _cycleRepository.cycles.listen((cycle) {
      _currentCycleSubscription?.cancel();

      _currentCycleSubscription = cycle.events.listen((event) {
        if (event is CycleProgressEvent) {
          emit(
            state.copyWith(
              currentCycleProgress: event.percentage,
            ),
          );
        } else if (event is CycleCompletedEvent) {
          _currentCycleSubscription?.cancel();
          _currentCycleSubscription = null;

          emit(state.clearCycleProgress());
        }
      });
    });
  }

  late GameRepository _repository;
  late CycleRepository _cycleRepository;
  late StreamSubscription<PlayerState> _subscription;
  late StreamSubscription<Cycle> _cycleSubscription;
  StreamSubscription<CycleEvent>? _currentCycleSubscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await _cycleSubscription.cancel();
    await _currentCycleSubscription?.cancel();

    await super.close();
  }
}
