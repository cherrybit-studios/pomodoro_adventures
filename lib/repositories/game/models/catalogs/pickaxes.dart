import 'package:pomodoro_adventures/repositories/repositories.dart';

const bronzePickaxe = Pickaxe(
  name: 'Bronze Pickaxe',
  description: 'A pickaxe made of bronze.',
  icon: 'gears/pickaxes/bronze_pickaxe.png',
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
