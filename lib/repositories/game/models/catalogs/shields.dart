import 'package:pomodoro_adventures/repositories/repositories.dart';

const _roundShieldIcon =
// ignore: lines_longer_than_80_chars
    '8,8;2,-1;4,0;3,-1;1,0;4,1;1,0;1,-1;1,0;6,1;2,0;2,1;2,0;2,1;2,0;2,1;2,0;2,1;2,0;6,1;1,0;1,-1;1,0;4,1;1,0;3,-1;4,0;2,-1';

const woodRoundShield = Shield(
  name: 'Wood Round Shield',
  description: 'A simple shield made of wood.',
  icon: _roundShieldIcon,
  sprite: 'assets/gear/shields/wood-round-shield.png',
  defense: 1,
);

const basicShields = GearCatalog(
  name: 'Basic Shields',
  description: 'Basic shields.',
  gears: [
    woodRoundShield,
  ],
);

const allShields = GearCatalog(
  name: 'All Shields',
  description: 'All shields available in the know world.',
  gears: [
    woodRoundShield,
  ],
);
