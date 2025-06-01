import 'package:flutter/material.dart';
import 'package:mood_tunes/models/track.dart';
import 'package:mood_tunes/mood_selection_screen.dart';
import 'package:mood_tunes/widgets/track_tile.dart';

class HomeScreen extends StatelessWidget {
  final String weatherCondition;
  final String weatherDescription;
  final double? temperature;
  final String iconUrl;
  final List<Track> tracks;

  const HomeScreen({
    super.key,
    required this.weatherCondition,
    required this.weatherDescription,
    required this.temperature,
    required this.iconUrl,
    required this.tracks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.mood),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MoodSelectionScreen()),
          );
        },
      ),
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text("MoodTunes"),
        backgroundColor: Colors.black87,
      ),
      body: Column(
        children: [
          _buildWeatherCard(),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "Mood-Based Playlist",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tracks.length,
              itemBuilder: (context, index) {
                return TrackTile(track: tracks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeatherCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            iconUrl.isNotEmpty
                ? Image.network(iconUrl, width: 60, height: 60)
                : Container(width: 60, height: 60),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weatherCondition,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  weatherDescription,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  '${temperature?.toStringAsFixed(1)} °C',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
