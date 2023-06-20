import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/l10n/l10n.dart';
import 'package:pomodoro_adventures/map/cubit/map_cubit.dart';
import 'package:pomodoro_adventures/repositories/game/game.dart';

class LocationPanel extends StatelessWidget {
  const LocationPanel({
    required this.locationId,
    required this.location,
    super.key,
  });

  final LocationId locationId;
  final Location location;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.watch<MapCubit>();

    final travelDistance = cubit.calculateTravelDistance();
    final isCurrentLocation = locationId == cubit.currentPlayerLocation();

    return NesContainer(
      label: location.name,
      width: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isCurrentLocation)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(l10n.travelDistance),
                Text(
                  travelDistance.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          else
            Text(
              l10n.youAreHere,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const SizedBox(height: 16),
          Text(
            l10n.points,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 4,
                ),
          ),
          const SizedBox(height: 16),
          for (final point in location.points)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    point.name,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  NesTooltip(
                    arrowPlacement: NesTooltipArrowPlacement.right,
                    message: point.summary,
                    child: NesIcon(
                      iconData: NesIcons.instance.exclamationMarkBlock,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 16),
          if (!isCurrentLocation &&
              cubit.currentPlayerLocation() != LocationId.travelling)
            NesButton(
              type: NesButtonType.primary,
              onPressed: () async {
                try {
                  final navigator = Navigator.of(context);
                  await cubit.travel();
                  navigator.pop();
                } on NoStaminaFailure {
                  // TODO(erickzanardo): Show a dialog explaining that the
                  // player
                }
              },
              child: Text(l10n.travel),
            ),
        ],
      ),
    );
  }
}
