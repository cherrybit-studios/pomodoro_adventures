import 'package:pomodoro_adventures/repositories/repositories.dart';

const _pickaxeIcon =
// ignore: lines_longer_than_80_chars
    '8,8;2,-1;4,0;6,-1;3,0;6,-1;3,0;4,-1;1,0;1,-1;2,0;3,-1;1,0;3,-1;1,0;2,-1;1,0;4,-1;1,0;1,-1;1,0;6,-1;1,0;7,-1';

const bronzePickaxe = Pickaxe(
  name: 'Bronze Pickaxe',
  description: 'A pickaxe made of bronze.',
  icon: _pickaxeIcon,
  sprite: 'gears/pickaxes/bronze_pickaxe.png',
  attack: 1,
  oresSupported: [
    OreType.tin,
    OreType.cooper,
  ],
);

const basicPickaxes = GearCatalog(
  name: 'Basic Pickaxes',
  description: 'Pickaxes for the aspiring miners.',
  gears: [
    bronzePickaxe,
  ],
);

const allPickaxes = GearCatalog(
  name: 'All Pickaxes',
  description: 'All pickaxes available in the know world.',
  gears: [
    bronzePickaxe,
  ],
);
