import 'dart:async';

import 'package:pomodoro_adventures/repositories/repositories.dart';

class NoStaminaFailure implements Exception {}

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

  void _newState(PlayerState state) {
    _current = state;
    _controller.add(state);
  }

  Future<void> load() async {
    // TODO(erickzanardo): load from persistense.

    _current = const PlayerState(
      attributes: PlayerAttributes(
        stamina: (10, 10),
      ),
      location: LocationId.fahsteadTown,
    );
  }

  Future<Cycle> startActivity(Activity activity) async {
    if (current.attributes.stamina.$1 - activity.staminaCost >= 0) {
      final minutes = switch (activity.type) {
        CycleType.short => 5,
        CycleType.medium => 15,
        CycleType.long => 25,
      };

      final cycle = _cycleRepository.createCycle(minutes);

      _newState(
        activity.onStart(
          current
              .applyStamina(-activity.staminaCost)
              .copyWith(currentActivity: activity),
        ),
      );

      unawaited(
        cycle.events.firstWhere((event) => event is CycleCompletedEvent).then(
          (_) {
            _newState(activity.onCompleteCycle(current));
          },
        ),
      );

      return cycle..start();
    } else {
      throw NoStaminaFailure();
    }
  }
}
