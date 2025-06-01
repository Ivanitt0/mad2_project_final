import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mood_tunes/models/track.dart';

class DeezerService {
  static Future<List<Track>> getTracksForMood(String mood) async {
    final query = Uri.encodeComponent(mood);
    final url = Uri.parse('https://api.deezer.com/search?q=$query');

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final tracks = data['data'] as List;
      return tracks.map((track) => Track.fromJson(track)).toList();
    } else {
      throw Exception('Failed to load tracks');
    }
  }

  /// ✅ Move this method INSIDE the class
  static Future<List<Track>> getTracksBasedOnWeather(String weather) {
    String mood;

    switch (weather.toLowerCase()) {
      case 'rain':
        mood = 'chill';
        break;
      case 'clear':
        mood = 'happy';
        break;
      case 'clouds':
        mood = 'lofi';
        break;
      default:
        mood = 'relax';
    }

    return getTracksForMood(mood);
  }
}
