import 'dart:async';

import 'package:pomodoro_adventures/repositories/repositories.dart';

class GameRepository {
  GameRepository({
    required CycleRepository cycleRepository,
    required PersistenceRepository persistenceRepository,
  })  : _cycleRepository = cycleRepository,
        _persintenceRepository = persistenceRepository;

  // ignore: unused_field
  final CycleRepository _cycleRepository;
  // ignore: unused_field
  final PersistenceRepository _persintenceRepository;

  final _controller = StreamController<PlayerState>();

  Stream<PlayerState> get playerState => _controller.stream;

  late PlayerState _current;

  PlayerState get current => _current;

  Future<void> load() async {
    // TODO(erickzanardo): load from persistense.

    _current = const PlayerState(
      attributes: PlayerAttributes(
        stamina: (10, 10),
      ),
      location: LocationId.fahsteadTown,
    );
  }
}
