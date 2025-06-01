import 'dart:convert';
import 'package:http/http.dart' as http;

String mapWeatherToGenre(String condition) {
  switch (condition.toLowerCase()) {
    case 'clear':
      return 'pop';
    case 'clouds':
      return 'acoustic';
    case 'rain':
      return 'jazz';
    case 'thunderstorm':
      return 'rock';
    case 'snow':
      return 'classical';
    case 'drizzle':
      return 'lofi';
    default:
      return 'pop';
  }
}

Future<List<Map<String, dynamic>>> fetchDeezerTracks(String genre) async {
  final url = Uri.parse("https://api.deezer.com/search?q=$genre");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final tracks = data['data'] as List;
    return tracks
        .take(10)
        .map(
          (track) => {
            'title': track['title'],
            'artist': track['artist']['name'],
            'preview': track['preview'],
            'albumCover': track['album']['cover_medium'],
          },
        )
        .toList();
  } else {
    throw Exception("Failed to load tracks");
  }
}
