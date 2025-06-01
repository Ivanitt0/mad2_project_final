import 'package:flutter/material.dart';
import 'package:mood_tunes/home_screen.dart';
import 'package:mood_tunes/services/weather_service.dart';
import 'package:mood_tunes/services/deezer_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final weather = await WeatherService.getWeather();
      final tracks = await DeezerService.getTracksBasedOnWeather(
        weather['main'],
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder:
              (context) => HomeScreen(
                weatherCondition: weather['main'],
                weatherDescription: weather['description'],
                temperature: weather['temp'],
                iconUrl: weather['iconUrl'],
                tracks: tracks,
              ),
        ),
      );
    } catch (e) {
      print('Error loading data: $e');
      // Show an error screen or retry logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
