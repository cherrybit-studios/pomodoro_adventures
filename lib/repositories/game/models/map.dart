import 'package:pomodoro_adventures/repositories/repositories.dart';

const map = <LocationId, Location>{
  LocationId.fahsteadTown: Location(
    x: 0,
    y: 0,
    name: 'Fahstead Town',
    points: [
      Shop(
        name: 'Five leaves General Store',
        // TODO(erickzanardo): items to seel
      ),
    ],
  ),
  LocationId.fahsteadMines: Location(
    x: 1,
    y: 1,
    name: 'Fahstead Mines',
    points: [
      Mine(
        name: 'Ground Level',
        ores: [
          OreType.cooper,
          OreType.tin,
        ],
      ),
    ],
  ),
};
