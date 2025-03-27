import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../level_selection/levels.dart';
import '../player_progress/player_progress.dart';
import 'endless_runner.dart';
import 'game_win_dialog.dart';

<<<<<<< HEAD
/// This widget defines the properties of the game screen.
///
/// It mostly sets up the overlays (widgets shown on top of the Flame game) and
/// the gets the [AudioController] from the context and passes it in to the
/// [EndlessRunner] class so that it can play audio.
=======
>>>>>>> 935c058 (upload)
class GameScreen extends StatelessWidget {
  const GameScreen({required this.level, super.key});

  final GameLevel level;

  static const String winDialogKey = 'win_dialog';
<<<<<<< HEAD
  static const String backButtonKey = 'back_buttton';
=======
  static const String backButtonKey = 'back_button';
  static const String jumpButtonKey = 'jump_button';
  static const String dropButtonKey = 'drop_button';
  static const String leftDashButtonKey = 'left_dash_button';
  static const String rightDashButtonKey = 'right_dash_button';
>>>>>>> 935c058 (upload)

  @override
  Widget build(BuildContext context) {
    final audioController = context.read<AudioController>();
<<<<<<< HEAD
=======

>>>>>>> 935c058 (upload)
    return Scaffold(
      body: GameWidget<EndlessRunner>(
        key: const Key('play session'),
        game: EndlessRunner(
          level: level,
          playerProgress: context.read<PlayerProgress>(),
          audioController: audioController,
        ),
        overlayBuilderMap: {
          backButtonKey: (BuildContext context, EndlessRunner game) {
            return Positioned(
              top: 20,
              right: 10,
              child: NesButton(
                type: NesButtonType.normal,
                onPressed: GoRouter.of(context).pop,
                child: NesIcon(iconData: NesIcons.leftArrowIndicator),
              ),
            );
          },
<<<<<<< HEAD
=======
          jumpButtonKey: (BuildContext context, EndlessRunner game) {
            return Positioned(
              bottom: 140,
              left: 100,
              child: Opacity(
                opacity: 0.5,
                child: NesButton(
                  type: NesButtonType.primary,
                  onPressed: () => game.jump(), // Jump up
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('↑'),
                  ),
                ),
              ),
            );
          },
          dropButtonKey: (BuildContext context, EndlessRunner game) {
            return Positioned(
              bottom: 20,
              left: 100,
              child: Opacity(
                opacity: 0.5,
                child: NesButton(
                  type: NesButtonType.warning,
                  onPressed: () => game.drop(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('↓'),
                  ),
                ),
              ),
            );
          },
          leftDashButtonKey: (BuildContext context, EndlessRunner game) {
            return Positioned(
              bottom: 80,
              left: 40,
              child: Opacity(
                opacity: 0.5,
                child: NesButton(
                  type: NesButtonType.success,
                  onPressed: () => game.dashLeft(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('←'),
                  ),
                ),
              ),
            );
          },
          rightDashButtonKey: (BuildContext context, EndlessRunner game) {
            return Positioned(
              bottom: 80,
              left: 160,
              child: Opacity(
                opacity: 0.5,
                child: NesButton(
                  type: NesButtonType.success,
                  onPressed: () => game.dashRight(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('→'),
                  ),
                ),
              ),
            );
          },
>>>>>>> 935c058 (upload)
          winDialogKey: (BuildContext context, EndlessRunner game) {
            return GameWinDialog(
              level: level,
              levelCompletedIn: game.world.levelCompletedIn,
            );
          },
        },
<<<<<<< HEAD
=======
        initialActiveOverlays: const [
          jumpButtonKey,
          dropButtonKey,
          leftDashButtonKey,
          rightDashButtonKey,
          backButtonKey,
        ],
>>>>>>> 935c058 (upload)
      ),
    );
  }
}
