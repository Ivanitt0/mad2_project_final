List<String> soundTypeToFilename(SfxType type) => switch (type) {
<<<<<<< HEAD
      SfxType.jump => const [
          'jump1.mp3',
        ],
      SfxType.doubleJump => const [
          'double_jump1.mp3',
=======
      // SfxType.jump => const [
      //     'jump1.mp3',
      //   ],
      SfxType.jump => const [
          'jump.mp3',
        ],
      SfxType.doubleJump => const [
          'jump.mp3',
>>>>>>> 935c058 (upload)
        ],
      SfxType.hit => const [
          'hit1.mp3',
          'hit2.mp3',
        ],
      SfxType.damage => const [
<<<<<<< HEAD
          'damage1.mp3',
          'damage2.mp3',
        ],
      SfxType.score => const [
          'score1.mp3',
          'score2.mp3',
        ],
      SfxType.buttonTap => const [
          'click1.mp3',
          'click2.mp3',
          'click3.mp3',
          'click4.mp3',
=======
          // 'player_hit_1.mp3',
          'player_hit.mp3',
        ],
      // SfxType.damage => const [
      //     'damage1.mp3',
      //     'damage2.mp3',
      //   ],
      // SfxType.score => const [
      //     'score1.mp3',
      //     'score2.mp3',
      //   ],
      SfxType.score => const [
          'slurp.mp3',
        ],
      // SfxType.buttonTap => const [
      //     'click1.mp3',
      //     'click2.mp3',
      //     'click3.mp3',
      //     'click4.mp3',
      //   ]
      SfxType.buttonTap => const [
          'select.mp3',
>>>>>>> 935c058 (upload)
        ]
    };

/// Allows control over loudness of different SFX types.
double soundTypeToVolume(SfxType type) {
  switch (type) {
    case SfxType.score:
    case SfxType.jump:
    case SfxType.doubleJump:
    case SfxType.damage:
    case SfxType.hit:
      return 0.4;
    case SfxType.buttonTap:
      return 1.0;
  }
}

enum SfxType {
  score,
  jump,
  doubleJump,
  hit,
  damage,
  buttonTap,
}
