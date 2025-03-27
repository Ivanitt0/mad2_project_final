import 'dart:math';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';

import '../endless_world.dart';

/// The [Obstacle] component can represent three different types of obstacles
/// that the player can run into.
class Obstacle extends SpriteComponent with HasWorldReference<EndlessWorld> {
  Obstacle.small({super.position})
<<<<<<< HEAD
      : _srcSize = Vector2.all(19.5),
        _srcPosition = Vector2(26, 28),
        super(
          size: Vector2.all(160),
          anchor: Anchor.bottomLeft,
        );

  Obstacle.tall({super.position})
=======
      : _srcSize = Vector2(16, 19),
        _srcPosition = Vector2(29, 28),
        super(
          size: Vector2.all(140),
          anchor: Anchor.bottomLeft,
        );

  Obstacle.lamppost({super.position})
>>>>>>> 935c058 (upload)
      : _srcSize = Vector2(30, 50),
        _srcPosition = Vector2.zero(),
        super(
          size: Vector2(200, 290),
          anchor: Anchor.bottomLeft,
        );

<<<<<<< HEAD
  Obstacle.wide({super.position})
      : _srcSize = Vector2(50, 22),
        _srcPosition = Vector2(44, 27),
=======
  Obstacle.jeep({super.position})
      : _srcSize = Vector2(50, 22),
        _srcPosition = Vector2(46, 27),
>>>>>>> 935c058 (upload)
        super(
          size: Vector2(290, 130),
          anchor: Anchor.bottomLeft,
        );

  /// Generates a random obstacle of type [ObstacleType].
  factory Obstacle.random({
    Vector2? position,
    Random? random,
<<<<<<< HEAD
    bool canSpawnTall = true,
  }) {
    final values = canSpawnTall
        ? const [ObstacleType.small, ObstacleType.tall, ObstacleType.wide]
        : const [ObstacleType.small, ObstacleType.wide];
    final obstacleType = values.random(random);
    return switch (obstacleType) {
      ObstacleType.small => Obstacle.small(position: position),
      ObstacleType.tall => Obstacle.tall(position: position),
      ObstacleType.wide => Obstacle.wide(position: position),
=======
    bool canSpawnLamp = true,
  }) {
    final values = canSpawnLamp
        ? const [ObstacleType.small, ObstacleType.lamppost, ObstacleType.jeep]
        : const [ObstacleType.small, ObstacleType.jeep];
    final obstacleType = values.random(random);
    return switch (obstacleType) {
      ObstacleType.small => Obstacle.small(position: position),
      ObstacleType.lamppost => Obstacle.lamppost(position: position),
      ObstacleType.jeep => Obstacle.jeep(position: position),
>>>>>>> 935c058 (upload)
    };
  }

  final Vector2 _srcSize;
  final Vector2 _srcPosition;

  @override
  Future<void> onLoad() async {
    // Since all the obstacles reside in the same image, srcSize and srcPosition
    // are used to determine what part of the image that should be used.
    sprite = await Sprite.load(
      'enemies/obs.png',
      srcSize: _srcSize,
      srcPosition: _srcPosition,
    );
    // When adding a RectangleHitbox without any arguments it automatically
    // fills up the size of the component.
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    // We need to move the component to the left together with the speed that we
    // have set for the world.
    // `dt` here stands for delta time and it is the time, in seconds, since the
    // last update ran. We need to multiply the speed by `dt` to make sure that
    // the speed of the obstacles are the same no matter the refresh rate/speed
    // of your device.
    position.x -= world.speed * dt;

    // When the component is no longer visible on the screen anymore, we
    // remove it.
    // The position is defined from the upper left corner of the component (the
    // anchor) and the center of the world is in (0, 0), so when the components
    // position plus its size in X-axis is outside of minus half the world size
    // we know that it is no longer visible and it can be removed.
    if (position.x + size.x < -world.size.x / 2) {
      removeFromParent();
    }
  }
}

enum ObstacleType {
  small,
<<<<<<< HEAD
  tall,
  wide,
=======
  lamppost,
  jeep,
>>>>>>> 935c058 (upload)
}
