import 'package:flutter/material.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:pomodoro_adventures/l10n/l10n.dart';
import 'package:pomodoro_adventures/repositories/repositories.dart';
import 'package:pomodoro_adventures/widgets/widgets.dart';

class PointsView extends StatelessWidget {
  const PointsView({
    required this.point,
    super.key,
  });

  final Point point;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GamePage(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                point.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              NesContainer(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  point.portrait,
                  filterQuality: FilterQuality.none,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: NesContainer(
                  width: double.infinity,
                  child: _PointView(point: point),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _PointView extends StatelessWidget {
  const _PointView({
    required this.point,
  });

  final Point point;

  @override
  Widget build(BuildContext context) {
    if (point is Shop) {
      return _ShopView(shop: point as Shop);
    }
    return const SizedBox.shrink();
  }
}

class _ShopView extends StatelessWidget {
  const _ShopView({
    required this.shop,
  });

  final Shop shop;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return NesTabView(
      tabs: [
        NesTabItem(
          label: l10n.buy,
          child: NesSingleChildScrollView(
            child: const SizedBox.shrink(),
          ),
        ),
        NesTabItem(
          label: l10n.description,
          child: NesSingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(shop.description),
            ),
          ),
        ),
      ],
    );
  }
}
