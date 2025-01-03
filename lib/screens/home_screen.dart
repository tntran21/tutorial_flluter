import 'package:flutter/material.dart';
import 'package:tutorial_1/core/services/songService.dart';
import 'package:tutorial_1/models/song_model.dart';
import 'package:tutorial_1/widgets/song/song_list.dart';
import 'package:tutorial_1/widgets/header_bar.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title: HeaderBar(title: widget.title),
        leadingWidth: 40,
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(),
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
      ),
    );
  }
}
