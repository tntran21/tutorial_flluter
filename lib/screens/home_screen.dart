import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_1/core/services/songService.dart';
import 'package:tutorial_1/models/song_model.dart';
import 'package:tutorial_1/utils/api_utils.dart';
import 'package:tutorial_1/widgets/song/song_list.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  List<SongModel> listSong = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // Set loading state to true
    setState(() {
      isLoading = true;
    });

    // Fetch music data
    fetchMusicData();
  }

  Future<void> fetchMusicData() async {
    // Fetch songs from the server
    final songService = await SongService().fetchSongs();
    setState(() {
      listSong = songService;
      isLoading = false;
    });
  }

  void onDetailPress(String id) {
    print('Detail press: ' + id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of songs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SongList(
                      listSong: listSong,
                      onDetailPress: (id) => {onDetailPress(id)},
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
