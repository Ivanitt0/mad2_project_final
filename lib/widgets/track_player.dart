import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mood_tunes/models/track.dart';
import '../services/deezer_service.dart';

class TrackPlayer extends StatefulWidget {
  final Track track;

  const TrackPlayer({super.key, required this.track});

  @override
  State<TrackPlayer> createState() => _TrackPlayerState();
}

class _TrackPlayerState extends State<TrackPlayer> {
  late AudioPlayer _player;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.setUrl(widget.track.preview);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void _togglePlayback() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            widget.track.cover,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          widget.track.title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(widget.track.artist),
        trailing: IconButton(
          icon: Icon(
            _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_fill,
            size: 32,
            color: Colors.deepPurple,
          ),
          onPressed: _togglePlayback,
        ),
      ),
    );
  }
}
