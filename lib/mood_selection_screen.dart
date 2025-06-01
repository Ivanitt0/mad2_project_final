import 'package:flutter/material.dart';
import 'package:mood_tunes/services/deezer_service.dart';
import 'package:mood_tunes/home_screen.dart';
import 'package:mood_tunes/services/weather_service.dart';

class MoodSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> moods = [
    {'mood': 'Happy', 'image': 'assets/images/happy.jpg'},
    {'mood': 'Sad', 'image': 'assets/images/sad.jpg'},
    {'mood': 'Chill', 'image': 'assets/images/chill.jpg'},
    {'mood': 'Relax', 'image': 'assets/images/relax.jpg'},
    {'mood': 'Lofi', 'image': 'assets/images/lofi.jpg'},
    {'mood': 'Energetic', 'image': 'assets/images/energetic.jpg'},
  ];

  MoodSelectionScreen({super.key});

  void _onMoodSelected(BuildContext context, String mood) async {
    final tracks = await DeezerService.getTracksForMood(mood);

    // Dummy weather data (you can let user skip weather and choose mood only)
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => HomeScreen(
              weatherCondition: mood,
              weatherDescription: 'User selected mood',
              temperature: null,
              iconUrl: '', // You can set a default or themed icon for moods
              tracks: tracks, // Make sure this is List<Track>
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a Mood')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children:
              moods.map((moodData) {
                return GestureDetector(
                  onTap: () => _onMoodSelected(context, moodData['mood']!),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(moodData['image']!, height: 40),
                        const SizedBox(height: 10),
                        Text(
                          moodData['mood']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
