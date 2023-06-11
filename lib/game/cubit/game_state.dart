part of 'game_cubit.dart';

class GameState extends Equatable {
  const GameState({
    required this.playerState,
  });

  final PlayerState playerState;

  GameState copyWith({
    PlayerState? playerState,
  }) {
    return GameState(
      playerState: playerState ?? this.playerState,
    );
  }

  @override
  List<Object> get props => [playerState];
}
