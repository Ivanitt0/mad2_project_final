const List<Song> songs = [
<<<<<<< HEAD
  Song('bit_forrest.mp3', 'Bit Forrest', artist: 'bertz'),
  Song('free_run.mp3', 'Free Run', artist: 'TAD'),
  Song('tropical_fantasy.mp3', 'Tropical Fantasy', artist: 'Spring Spring'),
=======
  // Song('bit_forrest.mp3', 'Bit Forrest', artist: 'bertz'),
  // Song('free_run.mp3', 'Free Run', artist: 'TAD'),
  // Song('tropical_fantasy.mp3', 'Tropical Fantasy', artist: 'Spring Spring'),
  // Song('halo_halo_song.mp3', 'Halo Halo', artist: 'chevy'),
  // Song('giga_chad.mp3', 'Giga Chad Theme'),
  Song('game-music.mp3', 'Game Music 6'),
  Song('game-music.mp3', 'Game Music 6'),
  Song('game-music.mp3', 'Game Music 6'),
>>>>>>> 935c058 (upload)
];

class Song {
  final String filename;

  final String name;

  final String? artist;

  const Song(this.filename, this.name, {this.artist});

  @override
  String toString() => 'Song<$filename>';
}
