import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicCard extends StatefulWidget {
  final String title;
  final String artist;
  final String previewUrl;
  final String albumCover;

  const MusicCard({
    super.key,
    required this.title,
    required this.artist,
    required this.previewUrl,
    required this.albumCover,
  });

  @override
  State<MusicCard> createState() => _MusicCardState();
}

class _MusicCardState extends State<MusicCard> {
  late AudioPlayer _player;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() => isPlaying = false);
      }
    });
  }

  Future<void> _togglePlay() async {
    if (isPlaying) {
      await _player.stop();
      setState(() => isPlaying = false);
    } else {
      try {
        await _player.setUrl(widget.previewUrl);
        await _player.play();
        setState(() => isPlaying = true);
      } catch (e) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error playing audio: $e")));
      }
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: Image.network(widget.albumCover),
        title: Text(widget.title),
        subtitle: Text(widget.artist),
        trailing: IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: _togglePlay,
        ),
      ),
    );
  }
}
