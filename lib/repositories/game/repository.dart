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
}
