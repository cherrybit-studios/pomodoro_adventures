part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState({
    required this.playerState,
    this.currentCycleProgress,
  });

  final PlayerState playerState;
  final double? currentCycleProgress;

  GameState copyWith({
    PlayerState? playerState,
    double? currentCycleProgress,
  }) {
    return GameState(
      playerState: playerState ?? this.playerState,
      currentCycleProgress: currentCycleProgress ?? this.currentCycleProgress,
    );
  }

  GameState clearCycleProgress() {
    return GameState(
      playerState: playerState,
    );
  }

  @override
  List<Object?> get props => [
        playerState,
        currentCycleProgress,
      ];
}
