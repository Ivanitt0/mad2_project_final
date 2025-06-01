import 'package:just_audio/just_audio.dart';

class AudioPlayerHandler {
  static final AudioPlayerHandler _instance = AudioPlayerHandler._internal();
  factory AudioPlayerHandler() => _instance;

  final AudioPlayer _player = AudioPlayer();

  AudioPlayerHandler._internal();

  Future<void> play(String url) async {
    await _player.stop(); // Stop previous track
    await _player.setUrl(url);
    await _player.play();
  }

  void stop() => _player.stop();

  void dispose() => _player.dispose();
}
