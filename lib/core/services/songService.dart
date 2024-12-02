import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tutorial_1/models/song_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class SongService {
  Future<List<SongModel>> fetchSongs() async {
    // read the json file in folder assets mocks
    final String jsonPath =
        await rootBundle.loadString('assets/mocks/song_db.json');
    // Decode JSON string
    final Map<String, dynamic> jsonData = json.decode(jsonPath);

    // Parse 'music' array from JSON
    final List<dynamic> musicList = jsonData['music'] ?? [];

    // Convert each item to SongModel
    return musicList.map((json) => SongModel.fromJson(json)).toList();
  }
}
