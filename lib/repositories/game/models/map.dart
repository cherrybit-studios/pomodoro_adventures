import 'package:pomodoro_adventures/repositories/repositories.dart';

const map = <LocationId, Location>{
  LocationId.fahsteadTown: Location(
    x: 10,
    y: 10,
    name: 'Fahstead Town',
    background: 'assets/locations/fahstead.png',
    points: [
      Shop(
        name: 'Wolfen’s Smithy',
        description: '''
Not much is known about Wolfen, not even his real name, some say that he came from the flooded forest of the Lowlands, others say that he lived for decades on top of Mount Verlavus, using the active volcano as his private forge.

All that is known for sure is that he is the most friendly person and his craft with metalworks are the best in the whole kingdom.
''',
        portrait: 'assets/locations/points/portraits/fahstead/wolfen.png',
        gearCatalogs: [
          basicPickaxes,
          basicShields,
          basicHelms,
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
        description: '',
        portrait: '',
        ores: [
          OreType.cooper,
          OreType.tin,
        ],
      ),
    ],
  ),
};
