class Track {
  final String title;
  final String artist;
  final String preview;
  final String cover;

  Track({
    required this.title,
    required this.artist,
    required this.preview,
    required this.cover,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      title: json['title'],
      artist: json['artist']['name'],
      preview: json['preview'],
      cover: json['album']['cover_medium'],
    );
  }
}
