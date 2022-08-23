import 'dart:math';

// For Player
import 'package:flame/components.dart';

// For box moving
import 'package:flame/effects.dart';
import 'package:flame/game.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';

// Orange Button
class ShotControl extends PositionComponent with Tappable {
  static final _paint = Paint()..color = Colors.orange;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }

  @override
  bool onTapUp(_) {
    print("tap up");
    return true;
  }

  @override
  bool onTapDown(_) {
    print("tap down");
    return true;
  }

  @override
  bool onTapCancel() {
    print("tap cancel");
    return true;
  }
}

// Box moving code
class MeterGame extends FlameGame with HasTappables {
  @override
  bool debugMode = false;

  @override
  void onMount() {
    camera.viewport = FixedResolutionViewport(Vector2(400, 600));

    final paint1 = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..color = Colors.deepOrange;

    // Red square, moving back and forth
    // TODO: move this into its own class
    add(
      RectangleComponent.square(
        // position: Vector2(200, 50),
        position: Vector2(50, 260),
        size: 12,
        paint: paint1,
      )..add(
          MoveEffect.to(
            Vector2(350, 260),
            EffectController(
              duration: 0.4,
              reverseDuration: 0.4,
              infinite: true,
              curve: Curves.linear,
            ),
          ),
        ),
    );

    // ShotControl
    add(
      ShotControl()
        ..position = Vector2(200, 560)
        ..width = 48
        ..height = 48
        ..anchor = Anchor.center,
    );
  }
}
