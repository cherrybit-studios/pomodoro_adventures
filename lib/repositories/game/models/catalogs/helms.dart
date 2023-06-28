import 'package:pomodoro_adventures/repositories/repositories.dart';

const _basicHelmIcon =
// ignore: lines_longer_than_80_chars
    '8,8;2,-1;4,0;3,-1;1,0;4,-1;1,0;1,-1;1,0;6,-1;2,0;6,-1;10,0;6,-1;9,0;8,-1';

const leatherCap = HeadArmor(
  name: 'Leather Cap',
  description: 'A simple cap made of raw leather.',
  icon: _basicHelmIcon,
  sprite: 'assets/gear/helms/leather-cap.png',
  defense: 1,
);

const leatherHelm = HeadArmor(
  name: 'Leather Helm',
  description: 'A leather helm that can protect from minor attacks.',
  icon: _basicHelmIcon,
  sprite: 'assets/gear/helms/leather-helm.png',
  defense: 1,
);

const basicHelms = GearCatalog(
  name: 'Basic Helms',
  description: 'Helms for the aspiring warriors.',
  gears: [
    leatherCap,
    leatherHelm,
  ],
);

const allHelms = GearCatalog(
  name: 'All Helms',
  description: 'All helms available in the know world.',
  gears: [
    leatherCap,
    leatherHelm,
  ],
);
