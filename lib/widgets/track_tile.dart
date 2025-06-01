import 'package:flutter/material.dart';
import 'package:mood_tunes/audio/audio_player_handler.dart';
import 'package:mood_tunes/models/track.dart';

class TrackTile extends StatelessWidget {
  final Track track;

  const TrackTile({super.key, required this.track});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Image.network(
          track.cover,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(track.title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          track.artist,
          style: const TextStyle(color: Colors.grey),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.play_arrow, color: Colors.white),
          onPressed: () {
            AudioPlayerHandler().play(track.preview);
          },
        ),
      ),
    );
  }
}
