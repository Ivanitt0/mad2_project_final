<<<<<<< HEAD
=======
import 'package:endless_runner/flame_game/components/flying_obstacle.dart';
>>>>>>> 935c058 (upload)
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/animation.dart';

import '../../audio/sounds.dart';
import '../effects/hurt_effect.dart';
import '../effects/jump_effect.dart';
import '../endless_runner.dart';
import '../endless_world.dart';
import 'obstacle.dart';
import 'point.dart';

/// The [Player] is the component that the physical player of the game is
/// controlling.
class Player extends SpriteAnimationGroupComponent<PlayerState>
    with
        CollisionCallbacks,
        HasWorldReference<EndlessWorld>,
        HasGameReference<EndlessRunner> {
  Player({
    required this.addScore,
<<<<<<< HEAD
=======
    required this.reduceScore,
>>>>>>> 935c058 (upload)
    required this.resetScore,
    super.position,
  }) : super(size: Vector2.all(150), anchor: Anchor.center, priority: 1);

  final void Function({int amount}) addScore;
<<<<<<< HEAD
=======
  final void Function({int amount}) reduceScore;
>>>>>>> 935c058 (upload)
  final VoidCallback resetScore;

  // The current velocity that the player has that comes from being affected by
  // the gravity. Defined in virtual pixels/s².
  double _gravityVelocity = 0;

  // The maximum length that the player can jump. Defined in virtual pixels.
<<<<<<< HEAD
  final double _jumpLength = 600;
=======
  final double _jumpLength = 500;
>>>>>>> 935c058 (upload)

  // Whether the player is currently in the air, this can be used to restrict
  // movement for example.
  bool get inAir => (position.y + size.y / 2) < world.groundLevel;

  // Used to store the last position of the player, so that we later can
  // determine which direction that the player is moving.
  final Vector2 _lastPosition = Vector2.zero();

  // When the player has velocity pointing downwards it is counted as falling,
  // this is used to set the correct animation for the player.
  bool get isFalling => _lastPosition.y < position.y;

  @override
  Future<void> onLoad() async {
    // This defines the different animation states that the player can be in.
    animations = {
      PlayerState.running: await game.loadSpriteAnimation(
        'dash/p1_running.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          textureSize: Vector2.all(34),
          stepTime: 0.20,
        ),
      ),
      PlayerState.jumping: SpriteAnimation.spriteList(
        [await game.loadSprite('dash/p1_jumping.png')],
        stepTime: double.infinity,
      ),
      PlayerState.falling: SpriteAnimation.spriteList(
        [await game.loadSprite('dash/p1_falling.png')],
        stepTime: double.infinity,
      ),
    };
    // The starting state will be that the player is running.
    current = PlayerState.running;
    _lastPosition.setFrom(position);

    // When adding a CircleHitbox without any arguments it automatically
    // fills up the size of the component as much as it can without overflowing
    // it.
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    // When we are in the air the gravity should affect our position and pull
    // us closer to the ground.
    if (inAir) {
      _gravityVelocity += world.gravity * dt;
      position.y += _gravityVelocity;
      if (isFalling) {
        current = PlayerState.falling;
      }
    }

    final belowGround = position.y + size.y / 2 > world.groundLevel;
    // If the player's new position would overshoot the ground level after
    // updating its position we need to move the player up to the ground level
    // again.
    if (belowGround) {
      position.y = world.groundLevel - size.y / 2;
      _gravityVelocity = 0;
      current = PlayerState.running;
    }

    _lastPosition.setFrom(position);
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    // When the player collides with an obstacle it should lose all its points.
    if (other is Obstacle) {
      game.audioController.playSfx(SfxType.damage);
      resetScore();
      add(HurtEffect());
    } else if (other is Point) {
      // When the player collides with a point it should gain a point and remove
      // the `Point` from the game.
      game.audioController.playSfx(SfxType.score);
      other.removeFromParent();
      addScore();
<<<<<<< HEAD
=======
    } else if (other is FlyingObstacle) {
      // When the player collides with a point it should gain a point and remove
      // the `Point` from the game.
      game.audioController.playSfx(SfxType.damage);
      reduceScore();
      add(HurtEffect());
>>>>>>> 935c058 (upload)
    }
  }

  /// [towards] should be a normalized vector that points in the direction that
  /// the player should jump.
  void jump(Vector2 towards) {
    current = PlayerState.jumping;
    // Since `towards` is normalized we need to scale (multiply) that vector by
    // the length that we want the jump to have.
    final jumpEffect = JumpEffect(towards..scaleTo(_jumpLength));

    // We only allow jumps when the player isn't already in the air.
    if (!inAir) {
      game.audioController.playSfx(SfxType.jump);
      add(jumpEffect);
    }
  }
<<<<<<< HEAD
=======

  void drop(Vector2 towards) {
    if (position.y > 0) {
      return;
    }
    final jumpEffect = JumpEffect(towards..scaleTo(400));
    add(jumpEffect);
  }

  void dash(Vector2 towards) {
    if (towards.x > 1 && position.x > 1) {
      return;
    } else if (towards.x < 1 && position.x < 1) {
      return;
    }

    final jumpEffect = JumpEffect(towards..scaleTo(500));
    add(jumpEffect);
  }
>>>>>>> 935c058 (upload)
}

enum PlayerState {
  running,
  jumping,
  falling,
}
