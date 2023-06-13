import 'package:flutter/material.dart';

export 'idle_scene.dart';
export 'travel_scene.dart';
export 'widgets/widgets.dart';

const sceneSize = Size(256, 240);

class BaseScene extends StatelessWidget {
  const BaseScene({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final useWidth = constraints.maxWidth < constraints.maxHeight;

          final scale = useWidth
              ? constraints.maxWidth / sceneSize.width
              : constraints.maxHeight / sceneSize.height;

          return Transform.scale(
            scale: scale,
            child: SizedBox.fromSize(
              size: sceneSize,
              child: ColoredBox(
                color: Colors.blue,
                child: child,
              ),
            ),
          );
        },
      ),
    );
  }
}
