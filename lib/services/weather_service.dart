import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class WeatherService {
  static const String _apiKey = '26e8f4496d1dfb1d6da2c28e68b64511';

  static Future<Position> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever ||
          permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<Map<String, dynamic>> getWeather() async {
    final position = await _getLocation();

    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=$_apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return {
        'main': data['weather'][0]['main'], // e.g., "Clear"
        'description': data['weather'][0]['description'], // e.g., "clear sky"
        'temp': data['main']['temp'], // e.g., 26.5
        'iconUrl':
            'https://openweathermap.org/img/wn/${data['weather'][0]['icon']}@2x.png',
      };
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
