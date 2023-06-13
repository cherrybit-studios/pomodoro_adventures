import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit({
    required GameRepository gameRepository,
  })  : _gameRepository = gameRepository,
        super(const MapState());

  final GameRepository _gameRepository;

  void select(LocationId? locationId) {
    emit(MapState(selected: locationId));
  }

  int calculateTravelDistance() {
    final selected = state.selected;
    if (selected == null || currentPlayerLocation() == LocationId.travelling) {
      return 0;
    }

    final currentPlayerLocationId = _gameRepository.current.location;
    final currentLocation = map[currentPlayerLocationId]!;

    final selectedLocation = map[selected]!;

    final distance = (Offset(
              currentLocation.x.toDouble(),
              currentLocation.y.toDouble(),
            ) -
            Offset(
              selectedLocation.x.toDouble(),
              selectedLocation.y.toDouble(),
            ))
        .distance
        .toInt();

    return distance;
  }

  LocationId currentPlayerLocation() {
    return _gameRepository.current.location;
  }

  Future<void> travel() async {
    final destination = state.selected;
    if (destination != null) {
      emit(const MapState());
      await _gameRepository.startActivity(
        Travel(
          destination: destination,
          travelCycles: 1,
        ),
      );
    }
  }
}
