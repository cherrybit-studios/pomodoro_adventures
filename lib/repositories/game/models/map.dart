import 'package:pomodoro_adventures/repositories/repositories.dart';

const map = <LocationId, Location>{
  LocationId.fahsteadTown: Location(
    x: 10,
    y: 10,
    name: 'Fahstead Town',
    background: 'assets/locations/fahstead.png',
    points: [
      Shop(
        name: 'Five leaves General Store',
        gearCatalogs: [],
      ),
      Shop(
        name: "Boar's Head Inn",
        gearCatalogs: [],
      ),
      Shop(
        name: 'Iron Hammer Smithy',
        gearCatalogs: [
          basicPickaxes,
        ],
      ),
    ],
  ),
  LocationId.fahsteadMines: Location(
    x: 11,
    y: 11,
    background: 'assets/locations/fahstead_mines.png',
    name: 'Fahstead Mines',
    points: [
      Mine(
        name: 'Ground Level veins',
        ores: [
          OreType.cooper,
          OreType.tin,
        ],
      ),
    ],
  ),
};
