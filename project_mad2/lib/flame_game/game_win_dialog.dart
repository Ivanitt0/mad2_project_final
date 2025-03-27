import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nes_ui/nes_ui.dart';
import 'package:provider/provider.dart';

import '../level_selection/levels.dart';
import '../style/palette.dart';

<<<<<<< HEAD
/// This dialog is shown when a level is completed.
///
/// It shows what time the level was completed in and if there are more levels
/// it lets the user go to the next level, or otherwise back to the level
/// selection screen.
=======
>>>>>>> 935c058 (upload)
class GameWinDialog extends StatelessWidget {
  const GameWinDialog({
    super.key,
    required this.level,
    required this.levelCompletedIn,
  });

<<<<<<< HEAD
  /// The properties of the level that was just finished.
  final GameLevel level;

  /// How many seconds that the level was completed in.
=======
  final GameLevel level;
>>>>>>> 935c058 (upload)
  final int levelCompletedIn;

  @override
  Widget build(BuildContext context) {
    final palette = context.read<Palette>();
<<<<<<< HEAD
    return Center(
      child: NesContainer(
        width: 420,
        height: 300,
=======

    return Center(
      child: NesContainer(
        width: 500,
        height: 460,
>>>>>>> 935c058 (upload)
        backgroundColor: palette.backgroundPlaySession.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
<<<<<<< HEAD
            Text(
              'Well done!',
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'You completed level ${level.number} in $levelCompletedIn seconds.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
=======
            // Well Done Message
            Text(
              'Deserve mo ng Halo-Halo!',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            // Halo-Halo Image
            Image.asset(
              'assets/images/halohalo.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 8),

            // Completion Time
            Text(
              levelCompletedIn < 60
                  ?
                  // 'You completed level ${level.number} in $levelCompletedIn seconds.',
                  '$levelCompletedIn seconds?! Amazing!'
                  : '$levelCompletedIn seconds. Nice man!',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            // Next Level Button (if applicable)
>>>>>>> 935c058 (upload)
            if (level.number < gameLevels.length) ...[
              NesButton(
                onPressed: () {
                  context.go('/play/session/${level.number + 1}');
                },
                type: NesButtonType.primary,
                child: const Text('Next level'),
              ),
<<<<<<< HEAD
              const SizedBox(height: 16),
            ],
=======
              const SizedBox(height: 12),
            ],

            // Level Selection Button
>>>>>>> 935c058 (upload)
            NesButton(
              onPressed: () {
                context.go('/play');
              },
              type: NesButtonType.normal,
              child: const Text('Level selection'),
            ),
          ],
        ),
      ),
    );
  }
}
